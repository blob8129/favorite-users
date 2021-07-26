//
//  UsersViewController.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 21/07/2021.
//

import UIKit

final class UsersViewController: UIViewController, UICollectionViewDelegate, UsersView {
    
    private let interactor: UsersInteractorInput
    
    private lazy var layout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(176))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(176))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        return UICollectionViewCompositionalLayout(section: NSCollectionLayoutSection(group: group))
    }()

    private lazy var collectionView: UICollectionView = { clv in
        clv.translatesAutoresizingMaskIntoConstraints = false
        clv.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseIdentifier)
        clv.backgroundColor = .systemBackground
        clv.delegate = self
        return clv
    }(UICollectionView(frame: CGRect.zero, collectionViewLayout: layout))
    
    enum Section { case main }
    
    typealias UsersDataSource = UICollectionViewDiffableDataSource<Section, UserViewModel>

    private lazy var dataSource = {
        UsersDataSource(collectionView: collectionView) { clv, indexPath, viewModel in
            let cell = clv.dequeueReusableCell(withReuseIdentifier: UserCell.reuseIdentifier,
                                               for: indexPath) as? UserCell
            cell?.configure(using: viewModel)
            cell?.setDefaultStyle()
            return cell
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllSubviews()
        interactor.loadUsers()
    }
    
    func reload(_ users: [UserViewModel]) {
        var snaphot = NSDiffableDataSourceSnapshot<Section, UserViewModel>()
        snaphot.appendSections([.main])
        snaphot.appendItems(users)
        dataSource.apply(snaphot)
    }
    
    private func addAllSubviews() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            view.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
    
    init(interactor: UsersInteractorInput) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UsersView
    func render(_ users: [UserViewModel]) {
        DispatchQueue.main.async {
            self.reload(users)
        }
    }
    
    func showError(description: String) {
        // TO DO: Show error
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        interactor.willDisplayItem(at: indexPath.row)
    }
}
