//
//  ViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 10/27/21.
//

import UIKit

protocol AddContactDelegate{
    
    func addNewContact(contact: Contact)
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddContactDelegate {
    

    @IBOutlet weak var contactsTableView: UITableView!
    
    var names: [String] = ["Brad Pitt", "Margot Robbie", "Leonardo Dicaprio", "Mark Rober", "Shawn Mendes"]
    
    var namesDictionary: [Character:[String]] = [:]
    
    var contactsDictionary: [Character: [Contact]] = [:]
    
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
        
        addContact(insert: Contact(name: "Brad Pitt", image: UIImage(named:"Brad")!, phoneNumber: "111111111"))
        addContact(insert: Contact(name: "Margot Robbie", image: UIImage(named:"Margot")!, phoneNumber: "111111111"))
        addContact(insert: Contact(name: "Leonardo Dicaprio", image: UIImage(named:"Leo")!, phoneNumber: "111111111"))
        addContact(insert: Contact(name: "Mark Rober", image: UIImage(named:"Mark")!, phoneNumber: "111111111"))
        addContact(insert: Contact(name: "Shawn Mendes", image: UIImage(named:"Shawn")!, phoneNumber: "111111111"))
        
        
//        sortNames()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addContactSegue" {
            
            let vc  = segue.destination as! AddContactViewController
            vc.contactDelegate = self
            
        }
        
    }
    
    
    
//    @IBAction func addNameButtonTapped(_ sender: Any) {
//
//        let alert = UIAlertController(title: "Add New Contact", message: "Enter the name of your friend.", preferredStyle: .alert)
//
//        alert.addTextField(configurationHandler: nil)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {alertAction in
//
//            guard let name = alert.textFields![0].text else { return }
//
//            if name.trimmingCharacters(in: .whitespaces) == "" { return }
//
//            self.addName(insert: name.trimmingCharacters(in: .whitespaces))
//
//            self.contactsTableView.reloadData()
//
//        }))
//
//
//
////        Closures: {(Parameters) -> (Return Type) in (BLOCK) }
//
//
//        self.present(alert, animated: true, completion: nil)
//
//
//    }
    
    //add name method
    func addContact(insert contact: Contact){
        
        let name = contact.name
        
        //get first letter
        let letter = name.lowercased().first!
        
        //get list
        var list = contactsDictionary[letter] == nil ? [] : contactsDictionary[letter]!
        
        //append to list
        list.append(contact)
        
        //update list
        contactsDictionary[letter] = list
        
    }
    
    //add name method
    func addName(insert name: String){
        
        //get first letter
        let letter = name.lowercased().first!
        
        //get list
        var list = namesDictionary[letter] == nil ? [] : namesDictionary[letter]!
        
        //append to list
        list.append(name)
        
        //update list
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
        return "\(contactsDictionary.keys.sorted()[section])".uppercased()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = contactsDictionary.keys.sorted()[section]
        let list = contactsDictionary[letter]!
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        
//        let name = getNameAtSectionRow(section: indexPath.section, row: indexPath.row)
        //letter of the section
        let letter = contactsDictionary.keys.sorted()[indexPath.section]
        
        //we'll get the list of that section
        let list = contactsDictionary[letter]!
        
        //we'll get the name of that section
        let contact = list[indexPath.row]
        
        
//        cell.textLabel!.text = name
        cell.setCell(contact: contact)
        
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


extension ViewController{
    
    func addNewContact(contact: Contact) {
        addContact(insert: contact)
        self.contactsTableView.reloadData()
    }
}

