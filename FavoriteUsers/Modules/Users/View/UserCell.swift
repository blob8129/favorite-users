//
//  UserCell.swift
//  FavoriteUsers
//
//  Created by Andrey Volobuev on 26/07/2021.
//

import UIKit

final class UserCell: UICollectionViewCell {
    
    static let reuseIdentifier = "UserCellReuseIdentifier"
    
    lazy var imageView: UIImageView = { imv in
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }(UIImageView())
    
    lazy var isFavoriteImageView: UIImageView = { imv in
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }(UIImageView())
    
    lazy var titleLabel = UILabel()
    lazy var detailsLabel1 = UILabel()
    lazy var detailsLabel2 = UILabel()
    lazy var detailsLabel3 = UILabel()
    
    lazy var stackView: UIStackView = { stv in
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.spacing = 8
        return stv
    }(UIStackView(arrangedSubviews: [
        titleLabel,
        detailsLabel1,
        detailsLabel2,
        detailsLabel3
    ]))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        contentView.addSubview(imageView)
        contentView.addSubview(isFavoriteImageView)
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 88),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            isFavoriteImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            contentView.rightAnchor.constraint(equalTo: isFavoriteImageView.rightAnchor, constant: 16),
    
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            contentView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16)
        ])
    }
    
    func setDefaultStyle() {
        titleLabel.font = .preferredFont(forTextStyle: .title3)
        [detailsLabel1, detailsLabel2, detailsLabel3].forEach {
            $0.font = .preferredFont(forTextStyle: .body)
            $0.textColor = .secondaryLabel
        }
        imageView.layer.cornerRadius = 44
        imageView.clipsToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray6.cgColor
    }
    
    func configure(using viewModel: UserViewModel) {
        titleLabel.text = viewModel.fullName
        detailsLabel1.text = viewModel.email
        detailsLabel2.text = viewModel.phone
        detailsLabel3.text = viewModel.city
        
        imageView.image = viewModel
            .imageData
            .flatMap { UIImage(data: $0) } ?? UIImage(systemName: "person")
        
        isFavoriteImageView.image = viewModel.isFavorite ?
            UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
}
