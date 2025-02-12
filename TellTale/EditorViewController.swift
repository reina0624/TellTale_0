//
//  EditorViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/02/09.
//

import UIKit

class EditorViewController: UIViewController {
    
    @IBOutlet var peacetextview: UITextView!
    
    var novelArray: [String] = []
    var saveData: UserDefaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
       // peacetextview.text = saveData.object(forKey: "lettertext") as? String
        //多分いらない。


        // Do any additional setup after loading the view.
    }
    @IBAction func save() {
        
        peacetextview.text = ""
        //        lettertextview = writtentextView
        novelArray.append(peacetextview.text!)
        
        let novelsavealert: UIAlertController = UIAlertController(title: "完了", message: "保存が完了します。", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default){ (action) in
            print("OK")
            self.saveData.set(self.novelArray, forKey: "writtentext")
            self.performSegue(withIdentifier: "writting", sender: nil)
            //        "WriteNovelViewController"
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel){ (action) in
            print("Cancel")
        }
        novelsavealert.addAction(cancelAction)
        novelsavealert.addAction(defaultAction)
        present(novelsavealert, animated: true, completion: nil)
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
