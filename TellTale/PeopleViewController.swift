//
//  PeopleViewController.swift
//  TellTale
//
//  Created by Reina Nakade on 2025/01/22.
//

import UIKit

class PeopleViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var peopleTitleLabel: UILabel!
    @IBOutlet var peopleCountLabel: UILabel!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var miuusButton: UIButton!
    @IBOutlet var peopleTable: UITableView!
    
    var peoplenumber: Int = 0
    //numberの名称変更につき、エラーの可能性あり。要注意。
    
    var playerArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleTable.dataSource = self
        peopleTable.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tuppedplusButton() {
        if peoplenumber == 20 {
            peoplenumber = peoplenumber + 0
        } else {
            peoplenumber = peoplenumber + 1
        }
        
        peopleCountLabel.text = String(peoplenumber)
        peopleTable.reloadData()
        
    }
    @IBAction func tuppedminusButton() {
        if peoplenumber == 0 {
            peoplenumber = peoplenumber + 0
        }
        else{
            peoplenumber = peoplenumber - 1
        }
        peopleCountLabel.text = String(peoplenumber)
        peopleTable.reloadData()
    }

    
    //MARK: セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoplenumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = playerArray[indexPath.row]
        
        return cell!
    }
    
    @IBAction func peopleCancelButton() {
        self.dismiss(animated: true)
        
        //        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func changeScreenToStartButton() {
        self.performSegue(withIdentifier: "toStart", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStart" {
            let StartViewController = segue.destination as! StartViewController
            StartViewController.peoplenumber = peoplenumber
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
