//
//  ListViewModel.swift
//  Todo List
//
//  Created by Ibrohim on 27/03/25.
//

import Foundation

class ListViewModel {
    var listArray = [List]()
    
    let coreDataHelper = CoreDataHelper()
    
    
    func fetchData() {
        listArray = coreDataHelper.fetchData() ?? [List]()
        
    
        
    }
    
    func saveData(title: String) {
        coreDataHelper.saveData(title: title)
        
    }
    
    func deleteData(index: Int) {
        
        coreDataHelper.deleteData(index: index)
        
        
    }
    
    
    
    
}
