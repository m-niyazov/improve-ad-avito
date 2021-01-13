//
//  SuggestionCell.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 13.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import UIKit

class SuggestionCell: UICollectionViewCell {
    var viewModel: SuggestionCellVM? {
        didSet {
            iconImage.image = viewModel!.iconImage()
            title.text = viewModel!.title
            subtitle.text = viewModel!.description
            price.text = viewModel!.price
        }
    }
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        backgroundColor = #colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)
        layer.cornerRadius = 10
        
        
        //IconImage
        contentView.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconImage.heightAnchor.constraint(equalToConstant: 52),
            iconImage.widthAnchor.constraint(equalToConstant: 52),
        ])
        
        //title
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: iconImage.topAnchor),
            title.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
    
        //subtitle
        contentView.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
        
        
        //price
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10),
            price.leadingAnchor.constraint(equalTo: subtitle.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
    }
}
