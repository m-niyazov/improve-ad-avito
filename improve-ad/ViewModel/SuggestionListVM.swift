//
//  SuggestionListVM.swift
//  improve-ad
//
//  Created by Muhamed Niyazov on 13.01.2021.
//  Copyright © 2021 Muhamed Niyazov. All rights reserved.
//

import Foundation


class SuggestionListVM {
    private var data: [Suggestion]!
    
    var listCount: Int {
        return data.count
    }
    
    
    init(_ suggestionList: [Suggestion]) {
        self.data = suggestionList
    }
    
    func viewModelForCell(indexPath: IndexPath) -> SuggestionCellVM {
        return SuggestionCellVM(data[indexPath.row])
    }
    
}
