//
//  UsersViewController.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 21/07/2021.
//

import UIKit

final class UsersViewController: UIViewController, UsersView {
    

    private let interactor: UsersInteractorInput
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        interactor.loadUsers()
    }
    
    init(interactor: UsersInteractorInput) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UsersView
    func render(_ users: [User]) {
        
    }
    
    func showError(description: String) {
        // TO DO: Show error
    }
}
