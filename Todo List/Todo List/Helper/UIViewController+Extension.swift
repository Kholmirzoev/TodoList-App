//
//  UIViewController+Extension.swift
//  Todo List
//
//  Created by Ibrohim on 27/03/25.
//

import UIKit


extension UIViewController {
    
    func alertWithTextField(with title: String,
                            _ message: String,
                            _ actionButtonTitle: String,
                            _ cancelButtonTitle:String,
                            _ placeholder: String,
                            _ comletion: @escaping (String) ->()) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField {
            textField in textField.placeholder = placeholder
            
        }
        let actionButton = UIAlertAction(title: actionButtonTitle, style: .default) { action in
            comletion(alertController.textFields?[0].text ?? "" )
            
        }
        
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        alertController.addAction(actionButton)
        alertController.addAction(cancelButton)
        present(alertController,animated: true, completion: nil)
        
    }
                             
    
}



