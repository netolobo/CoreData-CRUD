//
//  SecondDetailsTableViewCell.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 19/09/23.
//

import UIKit

class SecondDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var streetLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var postalCodeLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
