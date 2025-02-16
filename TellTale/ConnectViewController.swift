//
//  ConnectViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/02/05.
//

import UIKit

class ConnectViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var connectTextView:UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        
        titleTextField.text = saveData.object(forKey: "title") as? String
        let a:  [String] = saveData.object(forKey: "writtentext") as! [String]
        print(a)
        //print(saveData.object(forKey: "writtentext") )
        connectTextView.text = a.joined(separator: "\n")
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savenovel(_ sender:Any) {
        connectTextView.text = saveData.object(forKey: "noveltext") as? String
       saveData.set(titleTextField.text, forKey: "title")
        saveData.set(connectTextView.text, forKey: "noveltext")
      //  let novel:[String?] = [connectTextView.text,titleTextField.text]
       // saveData.set(novel, forKey: "novel")
        //教科書CollectionView1の内容　使うかもしれない

        let alert:UIAlertController = UIAlertController(title: "保存", message: "小説の保存が完了しました。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            print("okボタンが押されました。")
        }))
        present(alert,animated: true, completion: nil)
        
    }
    @IBAction func cancel (){
        
        let alert2: UIAlertController = UIAlertController(title: "保存されていません。", message: "最初の画面に戻りますか？", preferredStyle:  .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "Yes", style: .default){ (action) in
            print("OK")
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "No", style: .cancel){ (acrion) in
            print("Cancel")
        }
        alert2.addAction(defaultAction)
        alert2.addAction(cancelAction)
        
        present(alert2, animated: true, completion: nil)
        
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
