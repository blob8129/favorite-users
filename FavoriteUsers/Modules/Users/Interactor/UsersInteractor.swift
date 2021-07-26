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
    private let imagesService: ImagesService
    
    private var users = [User]()
    private var imageDataByURL = [URL: Data]()
    
    
    init(baseURL: URL, usersRepository: R, imagesService: ImagesService) {
        self.baseURL = baseURL
        self.usersRepository = usersRepository
        self.imagesService = imagesService
    }
    
    // MARK: UsersInteractorInput
    func loadUsers() {
        let url = baseURL.appendingPathComponents("api", "users")
        usersRepository.fetch(at: url) { result in
            switch result {
            case .success(let usersContainer):
                self.users = usersContainer.users
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
    
    private func composeAndRender() {
        let context = UserContext(imageData: self.imageDataByURL, isFavorite: false)
        let veiwModels = self.users.convert(using: context)
        self.view?.render(veiwModels)
    }
}
