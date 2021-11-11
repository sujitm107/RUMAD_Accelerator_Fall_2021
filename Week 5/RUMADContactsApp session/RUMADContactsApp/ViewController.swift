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
    
    @IBAction func addNameButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add New Contact", message: "Enter the name of your friend.", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: nil))
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    //add name method
    
    func sortNames() {
        
        for name in names{
            let firstLetter: Character = name.lowercased().first!
            var currentList = (namesDictionary[firstLetter] == nil) ? [] : namesDictionary[firstLetter]!
            currentList.append(name)
            namesDictionary[firstLetter] = currentList
        }
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(namesDictionary.keys.sorted()[section])".uppercased()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return namesDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = namesDictionary.keys.sorted()[section]
        let list = namesDictionary[letter]!
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
//        let name = getNameAtSectionRow(section: indexPath.section, row: indexPath.row)
        //letter of the section
        let letter = namesDictionary.keys.sorted()[indexPath.section]
        
        //we'll get the list of that section
        let list = namesDictionary[letter]!
        
        //we'll get the name of that section
        let name = list[indexPath.row]
        
        cell.textLabel!.text = name
        
        return cell
        
    }
    
//    func getNameAtSectionRow(section: Int, row: Int) -> String{
//
//        //letter of the first section
//        let letter = namesDictionary.keys.sorted()[section] //D
//
//        //namesDictionary.keys.sorted() -> list [A, D, J, M, P]
//
//        //get the list of the first section
//        let list = namesDictionary[letter]!
//
//        //get the name at the row
//        return list[row]
//
//    }
// MARK: This is how tableviews are being made behind the scenes
//    let count = tableview(contactsTableview, numberOfRowsInSection: <Section>) // 5
    
/*
     for (int i = 0; i<count; i++){
        cell = tableview(contactsTableView, cellforRowAt: indexPath)
     
     }
     
     code to append given cell to the table
     
     
     */
    
    
   

}

