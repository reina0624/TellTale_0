//
//  WrittingViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/01/22.
//

import UIKit

class WrittingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    ///reloadViewController()を導入する。９
    
    @IBOutlet var writtingtable:UITableView!
    @IBOutlet var turnlabel: UILabel!
    @IBOutlet var themelabel: UILabel!

    
    var index: Int = 0
    
    var novelArray: [String] = []
    var saveData: UserDefaults = UserDefaults.standard
    var playerArray: [String] = []
    
    var tappedagain: Bool = true
    // var themeoriginArray: [String] = []
    //  var countArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedPlayers = saveData.array(forKey: "people") as? [String] {
            playerArray = savedPlayers
        }
        
        writtingtable.register(UINib(nibName: "EditorTableViewCell", bundle: nil), forCellReuseIdentifier: "writecell")
        writtingtable.rowHeight = 224
        writtingtable.dataSource = self
        writtingtable.delegate = self

        
        if playerArray.indices.contains(index) {
            turnlabel.text = "\(playerArray[index])の番です！"
        } else {
            turnlabel.text = "プレイヤーがいません"
        }
        themelabel.text = saveData.object(forKey:"themedata") as? String
        
        tappedagain = false
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return novelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "writecell", for: indexPath) as! EditorTableViewCell
        if novelArray.indices.contains(indexPath.row) {
            cell.peacetextview.text = novelArray[indexPath.row]
        } else {
            cell.peacetextview.text = ""
        }
        if index == indexPath.row {
            cell.setEditable(true)
        } else {
            cell.setEditable(false)
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 224
    }
    
    @IBAction func WroteButton (_ sender:Any){
        
        if index + 1 < playerArray.count {
            index += 1
            turnlabel.text = "\(playerArray[index])の番です！"
            if let cell = writtingtable.cellForRow(at: IndexPath(row: index, section: 0)) as? EditorTableViewCell {
                if let text = cell.peacetextview.text {
                    novelArray.append(text)
                }
            }            
            let novelsavealert: UIAlertController = UIAlertController(title: "完了", message: "保存が完了します。", preferredStyle: .alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default){ (action) in
                print("OK")
                self.saveData.set(self.novelArray, forKey: "writtentext")
                // self.performSegue(withIdentifier: "writting", sender: nil)
            }
            let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel){ (action) in
                print("Cancel")
            }
            novelsavealert.addAction(cancelAction)
            novelsavealert.addAction(defaultAction)
            present(novelsavealert, animated: true, completion: nil)
            writtingtable.reloadData()
            
        }
        else {
            
            turnlabel.text = "全ての小説の制作完了！"
            let alert: UIAlertController = UIAlertController(title: "全ての小説完了", message: "保存します", preferredStyle:  .alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .default){ (action) in
                print("OK")
                // 終わり
                self.saveData.set(self.novelArray, forKey: "writtentext")
                //画面遷移
                self.performSegue(withIdentifier: "toconnect", sender: nil)
            }
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
        }
        
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
