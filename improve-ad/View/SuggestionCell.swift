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
            title.text = viewModel!.title
            subtitle.text = viewModel!.description
            price.text = viewModel!.price
            setImageIcon()
        }
    }
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var isSelectedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image =  UIImage(systemName: "checkmark.circle.fill");
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("DEBUG: Init cell")
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                self.isSelectedIcon.alpha = 0.0
                self.isSelectedIcon.isHidden = false
                UIView.animate(withDuration: 0.3){
                    self.isSelectedIcon.alpha = 1.0
                }
            } else {
                self.isSelectedIcon.alpha = 1.0
                self.isSelectedIcon.isHidden = false
                UIView.animate(withDuration: 0.3){
                    self.isSelectedIcon.alpha = 0.0
                }
                
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.4) {
                self.backgroundColor = self.isHighlighted ? .grayLight : .cellBackground
            }
        }
    }
    
    
    func setImageIcon() {
        if (iconImage.image == nil) {
            DispatchQueue.main.async {
                self.iconImage.image = self.viewModel?.iconImage()
            }
        }
    }
    
    func configureCell() {
        backgroundColor = UIColor.cellBackground
        layer.cornerRadius = 10
        
        
        //iconImage
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
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        
        //subtitle
        contentView.addSubview(subtitle)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        
        
        //price
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10),
            price.leadingAnchor.constraint(equalTo: subtitle.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        
        //isSelecteedIcon
        contentView.addSubview(isSelectedIcon)
        isSelectedIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            isSelectedIcon.topAnchor.constraint(equalTo: title.topAnchor, constant: 15),
            isSelectedIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            isSelectedIcon.heightAnchor.constraint(equalToConstant: 25),
            isSelectedIcon.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
}


