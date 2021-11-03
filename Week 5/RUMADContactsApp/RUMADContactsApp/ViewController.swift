//
//  ViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 10/27/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var contactsTableView: UITableView!
    
    var names: [String] = ["Brad Pitt", "Margot Robbie", "Leonardo Dicaprio", "Mark Rober", "Shawn Mendes"]
    
    var namesDictionary: [Character:[String]] = [:]
    
    /*
        [
            B: ["Brad Pitt"]
            M: ["Margot Robbie", "Mark Rober"]
            S: ["Shawn Mendes"]
            L: ["Leonardo Dicaprio"]
     
        ]
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        sortNames()
        
        
    }
    
    func sortNames() {
        
        for name in names{
            let firstLetter: Character = name.lowercased().first!
            var currentList = (namesDictionary[firstLetter] == nil) ? [] : namesDictionary[firstLetter]!
            currentList.append(name)
            namesDictionary[firstLetter] = currentList
        }
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return namesDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel!.text = names[indexPath.row]
        
        return cell
        
    }
// MARK: This is how tableviews are being made behind the scenes
//    let count = tableview(contactsTableview, numberOfRowsInSection: <Section>) // 5
    
/*
     for (int i = 0; i<count; i++){
        cell = tableview(contactsTableView, cellforRowAt: indexPath)
     
     }
     
     code to append given cell to the table
     
     
     */
    
    
   

}

