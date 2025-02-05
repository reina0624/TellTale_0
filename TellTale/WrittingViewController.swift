//
//  WrittingViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/01/22.
//

import UIKit

class WrittingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var writtingtable:UITableView!
    @IBOutlet var turnlabel: UILabel!
    @IBOutlet var themelabel: UILabel!

    
    var peoplenumber: Int = 0
    var index: Int = 0
    let playerArray: [String] = []

    var novelArray: [String] = []
    var saveData: UserDefaults = UserDefaults.standard
    var tappedagain: Bool = true
   // var themeoriginArray: [String] = []
  //  var countArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        writtingtable.dataSource = self
        writtingtable.delegate = self
        writtingtable.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        writtingtable.rowHeight = 224
        
        turnlabel.text = "\(playerArray[index])の番です！"
        themelabel.text = saveData.object(forKey:"themedata") as? String
        
        tappedagain = false

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return novelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.label.text = novelArray[indexPath.row]
        return cell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        //        cell?.textLabel?.text = novelArray[indexPath.row]
        //        return cell!a
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 224
    }
    
    @IBAction func WroteButton (_ sender:Any){
        index += 1
        
        if index <= peoplenumber {
            turnlabel.text = "\(playerArray[index])の番です！"
            writtingtable.reloadData()
            self.performSegue(withIdentifier: "make one novel", sender: nil)
            
        }
        if self.index == peoplenumber {
            
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
