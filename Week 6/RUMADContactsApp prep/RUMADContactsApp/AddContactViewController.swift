//
//  AddContactViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 11/10/21.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    var contactDelegate: AddContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tappedProfileImageView(_ sender: Any) {
        
    }
    
    
    @IBAction func addContactButtonTapped(_ sender: Any) {
        //call protocol method
        guard let name = NameTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        guard let number = phoneNumberTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        if name == "" || number == "" {
            return
        }
        
        let newContact = Contact(name: name, image: UIImage(systemName: "plus")!, phoneNumber: number)
        
        contactDelegate?.addNewContact(contact: newContact)
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
