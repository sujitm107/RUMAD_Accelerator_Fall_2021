//
//  ContactCell.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 11/10/21.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(contact: Contact){
        contactImage.image = contact.image
        contactName.text = contact.name
    }

}
