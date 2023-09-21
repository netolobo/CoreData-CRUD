//
//  ThirdDetailsTableViewCell.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 19/09/23.
//

import UIKit

class ThirdDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
