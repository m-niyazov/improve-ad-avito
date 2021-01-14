//
//  SuggestionCellVM.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 13.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import Foundation
import UIKit

class SuggestionCellVM {
    private var data: Suggestion!
    
    var title: String {
        return data.title
    }
    var description: String {
        return data.description
    }
    
    var price: String {
        return data.price
    }
    
    func iconImage() -> UIImage {
        var image = UIImage()
        let urlString = self.data.icon.first!.value
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                image = UIImage(data: data)!
            }
        }
        return image
    }
    
    init(_ suggestion: Suggestion) {
        self.data = suggestion
    }
    
}
