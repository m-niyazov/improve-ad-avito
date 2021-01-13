//
//  SuggestionsList.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 12.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SuggestionCell"

class SuggestionsList: UICollectionViewController {
    var viewModel: SuggestionListVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        self.collectionView!.register(SuggestionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
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
}

// MARK: UICollectionViewDelegateFlowLayout
extension SuggestionsList: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(collectionView.frame.size.width)
        let cellHeight = CGFloat(200)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
