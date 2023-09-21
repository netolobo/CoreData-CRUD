//
//  StudentViewCell.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 15/09/23.
//

import UIKit

class StudentViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.roundImage()
        }
    }
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var studentID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
