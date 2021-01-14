//
//  AlertController.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 14.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import UIKit

class AlertController: UIAlertController {
    var viewModel: SuggestionCellVM? {
        didSet {
            configureUI()
        }
    }
    func configureUI() {
        addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        guard let viewModel = viewModel else {
            title = "Необходимо выбрать один из вариантов"
            return
        }
        title = "\(viewModel.title)"
        message = "\(viewModel.description)"
       
        
    }
}
