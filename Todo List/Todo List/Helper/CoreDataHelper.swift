//
//  CoreDataHelper.swift
//  Todo List
//
//  Created by Ibrohim on 27/03/25.
//

import Foundation
import UIKit

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [List]? {
        do {
            return try self.context.fetch(List.fetchRequest())
            
        }
        catch {
            print("error \(error.localizedDescription)")
            
        }
        return nil
        
    }
    
    func saveData(title: String){
        let list  = List(context: context)
        list.title = title
        
        do {
            try self.context.save()
        }
        catch {
            print("error: \(error.localizedDescription)")
        }
        
        
    }
    
    func deleteData(index: Int) {
        if let data = fetchData() {
            context.delete(data[index])
        }
        do {
            try self.context.save()
        }
        catch {
            print("error: \(error.localizedDescription)")
        }
    }
}
