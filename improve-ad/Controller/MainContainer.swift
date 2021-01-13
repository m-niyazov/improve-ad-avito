//
//  MainContainerViewController.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 12.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import UIKit

class MainContainer: UIViewController {
    //MARK: - Properties
    var viewModel = MainContainerVM()
    
    lazy var closeIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "xmark")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var screenTitle: UILabel = {
        let title = UILabel()
        title.text = self.viewModel.title
        title.font = UIFont.boldSystemFont(ofSize: 30)
        title.numberOfLines = 0
        return title
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6784313725, blue: 1, alpha: 1)
        button.setTitle(self.viewModel.selectedActionTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var collectionView: UIView =  {
        let collectionController = SuggestionsList(viewModel: self.viewModel.viewModelForSuggestionList())
        addChild(collectionController)
        return collectionController.view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .white
        //view
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
        ])
        // closeIcon
        contentView.addSubview(closeIcon)
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            closeIcon.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 30),
            closeIcon.widthAnchor.constraint(equalToConstant: 20),
            closeIcon.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // screenTitle
        contentView.addSubview(screenTitle)
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            screenTitle.topAnchor.constraint(equalTo: closeIcon.bottomAnchor , constant: 20),
            screenTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screenTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        // choiseButton
        contentView.addSubview(chooseButton)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -25),
            chooseButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            chooseButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            chooseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // collectionView
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: chooseButton.topAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            
        ])
        
    }
    
}
