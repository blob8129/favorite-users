//
//  UsersInteractor.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 25/07/2021.
//

import Foundation

struct UsersRepository: RepositoryProtocol {
    let networkService: NetworkServiceProtocol
    let decoder: JSONDecoder
    
    typealias Entity = UsersContainer
}

final class UsersInteractor<R: RepositoryProtocol>: UsersInteractorInput where R.Entity == UsersContainer {

    weak var view: UsersView?
  
    private let baseURL: URL
    private let usersRepository: R
    private let imagesService: ImagesServiceProtocol
    private let isFavoriteStateStorage: PersistentStorage<[String: Bool]>
    
    private var users = [User]()
    private var imageDataByURL = [URL: Data]()
    private var isFavoriteStates = [String: Bool]()
    
    
    init(baseURL: URL,
         usersRepository: R,
         imagesService: ImagesServiceProtocol,
         isFavoriteStateStorage: PersistentStorage<[String: Bool]>) {
        self.baseURL = baseURL
        self.usersRepository = usersRepository
        self.imagesService = imagesService
        self.isFavoriteStateStorage = isFavoriteStateStorage
    }

    private func composeAndRender() {
        let context = UserContext(imageData: imageDataByURL, isFavorite: isFavoriteStates)
        let veiwModels = users.convert(using: context)
        view?.render(veiwModels)
    }
    
    // MARK: UsersInteractorInput
    func loadUsers() {
        let url = baseURL.appendingPathComponents("api", "users")
        usersRepository.fetch(at: url) { result in
            switch result {
            case .success(let usersContainer):
                self.users = usersContainer.users
                self.isFavoriteStates = self.isFavoriteStateStorage.load() ?? [:]
                self.composeAndRender()
            case .failure(let error):
                self.view?.showError(description: error.localizedDescription)
            }
        }
    }
    
    func willDisplayItem(at index: Int) {
        let url = users[index].picture.medium
        imagesService.fetchImage(at: url) { result in
            switch result {
            case .success((let url, let data)):
                self.imageDataByURL[url] = data
                self.composeAndRender()
            case .failure:
                break
            }
        }
    }
    
    func changeIsFavoriteState(at index: Int) {
        let user = users[index]
        var isFavorite = isFavoriteStates[user.phone, default: false]
        isFavorite.toggle()
        isFavoriteStates[user.id] = isFavorite
        composeAndRender()
        isFavoriteStateStorage.save(item: isFavoriteStates)
    }
}
