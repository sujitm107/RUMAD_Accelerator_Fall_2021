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
        
        let alert = UIAlertController(title: "New Contact", message: "Add a new name", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            
            guard let newName = alert.textFields![0].text else { return }
            
            if newName.trimmingCharacters(in: .whitespaces) == "" { return }
            
            self.addNewName(name: newName)
            
            self.contactsTableView.reloadData()
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func addNewName(name: String){
        //GET LETTER
        let letter = name.lowercased().first!
        
        //GET LIST
        var list = namesDictionary[letter] == nil ? [] : namesDictionary[letter]!
        
        //ADD TO LIST
        list.append(name)
        
        namesDictionary[letter] = list
        
    }
    
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
        //Want to get the letter
        let letter = namesDictionary.keys.sorted()[section]
        
        //Want to get the list
        let list = namesDictionary[letter]!
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let letter = namesDictionary.keys.sorted()[indexPath.section]
        let list = namesDictionary[letter]!
        
        cell.textLabel!.text = list[indexPath.row]
        
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

