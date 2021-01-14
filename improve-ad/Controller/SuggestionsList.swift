//
//  SuggestionsList.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 12.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "suggestionCell"

protocol SuggestionsListDelegate {
    func selectedSuggestion(suggestion:SuggestionCellVM)
}

class SuggestionsList: UICollectionViewController {
    // MARK: - Properties
    var viewModel: SuggestionListVM!
    var delegate: SuggestionsListDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(SuggestionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
    }
    
    // MARK: - Initialize
    init(viewModel: SuggestionListVM) {
        self.viewModel = viewModel
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: UICollectionViewDataSource
extension SuggestionsList {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel.listCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SuggestionCell
        cell.viewModel = viewModel.viewModelForCell(indexPath: indexPath)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currentCell = collectionView.cellForItem(at: indexPath) as? SuggestionCell  else { return }
        if currentCell.isSelected {
            print(currentCell.isSelected)
            self.delegate?.selectedSuggestion(suggestion: currentCell.viewModel!)
        }
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension SuggestionsList: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(collectionView.frame.size.width)
        let cellHeight = CGFloat(180)
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
