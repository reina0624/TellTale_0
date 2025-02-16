//
//  EditorTableViewCell.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/02/12.
//

import UIKit

class EditorTableViewCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet var peacetextview: UITextView!
    
    var onTextChanged: ((String) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        peacetextview.delegate = self
        peacetextview.font = UIFont.systemFont(ofSize: 16) // フォント設定
        peacetextview.isScrollEnabled = true // スクロールを有効にする
        peacetextview.isEditable = false // 編集可能にする（必要に応じて変更）
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textViewDidChange(_ textView: UITextView) {
            // 必要に応じて入力が変わるたびに処理を追加することができます
            print("Text changed: \(textView.text ?? "")")
        }
    func setEditable(_ editable: Bool) {
            peacetextview.isEditable = editable
        }

        // 編集終了時に呼ばれるメソッド
        func textViewDidEndEditing(_ textView: UITextView) {
            // 編集終了後にデータを保存する処理を追加する場合に活用できます
            onTextChanged?(textView.text ?? "")
            print("Editing ended for cell")
        }
    }



