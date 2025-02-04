//
//  PeopleCustomTableViewCell.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/02/05.
//

import UIKit

class PeopleCustomTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet var playerTextField: UITextField!
    
    var onNameChanged: ((String) -> Void)? // コールバッククロージャで値を渡す
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playerTextField.delegate = self

    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        onNameChanged?(textField.text ?? "")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
