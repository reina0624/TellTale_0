//
//  CustomTableViewCell.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/02/02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var label: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
