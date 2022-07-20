//
//  TableViewCell.swift
//  fitcontact
//
//  Created by CSE on 19/07/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var trainerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
