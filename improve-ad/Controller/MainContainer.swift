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
        var button = chooseButtonSettings()
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var collectionView: UIView =  {
        let suggestionViewModel = self.viewModel.viewModelForSuggestionList()
        let collectionController = SuggestionsList(viewModel: suggestionViewModel )
        addChild(collectionController)
        collectionController.delegate = self
        return collectionController.view
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - Selectors
    @objc func handleChoseBUtton(sender: UIButton) {
        UIButton.animateHandleButton(sender: sender) {  
            guard let suggestion = self.viewModel.selectedSuggestion else {
                self.initAlertController(suggestion: nil)
                return
            }
            self.initAlertController(suggestion: suggestion)
        }
        
    }
    
    //MARK: - Constraints
    func configureView() {
        view.backgroundColor = .white
        // view
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
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
        configureChoiseButton()
        
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
    
    func configureChoiseButton() {
        contentView.addSubview(chooseButton)
        chooseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chooseButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: -25),
            chooseButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            chooseButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            chooseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: - Helpers
    func initAlertController(suggestion: SuggestionCellVM?) {
        let alert = AlertController(title: "", message: "", preferredStyle: .alert)
        alert.viewModel = suggestion
        present(alert, animated: true)
    }
    
    func chooseButtonSettings() -> UIButton {
        let isActive = (viewModel.selectedSuggestion != nil) ? true : false
        let title = viewModel.selectedActionTitle
        let button = UIButton()
        button.setTitleColor(isActive ? .white : .mainBlue, for: .normal)
        button.setTitle(title, for: .normal)
        button.backgroundColor = isActive ? .mainBlue : .disableBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleChoseBUtton(sender:)), for: .touchUpInside)
        return button
    }
}

 
extension MainContainer: SuggestionsListDelegate {
    func selectedSuggestion(suggestion: SuggestionCellVM) {
        viewModel.selectedSuggestion = suggestion
        chooseButton = chooseButtonSettings()
        configureChoiseButton()
    }
}
