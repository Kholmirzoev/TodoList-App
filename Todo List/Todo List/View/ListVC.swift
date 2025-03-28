//
//  ListVC.swift
//  Todo List
//
//  Created by Ibrohim on 27/03/25.
//

import UIKit

class ListVC: UIViewController {
    
    let viewModel = ListViewModel()
    

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    
    fileprivate func updateTableView() {
        viewModel.fetchData()
        table.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        alertWithTextField(with: "Add Item",
                           "",
                           "Add",
                           "Cancel",
                           "Enter here") { text in
            if !text.isEmpty {
                self.viewModel.saveData(title: text)
                self.table.reloadData()
                self.updateTableView()

            }
            
        }
    }
}


extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.listArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = viewModel.listArray[indexPath.row].title
        return cell
        
    }
}

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteData(index: indexPath.row)
            updateTableView()
        }
    }
}
