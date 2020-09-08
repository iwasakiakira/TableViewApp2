//
//  TableViewController.swift
//  TableViewApp2
//
//  Created by いわし on 2020/09/08.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

   var names: [String] = [
        "阿部",
        "石田",
        "上田",
        "遠藤",
        "及川",
        "梶原",
        "菊池",
        "工藤",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        names.removeAll()
    }

   var resultArray = [String]()
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)

      cell.textLabel?.text = resultArray[indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        return true
    }
    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
     override  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == UITableViewCell.EditingStyle.delete {
               resultArray.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
           }
        UserDefaults.standard.set(resultArray, forKey: "add")
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           
           //addというキー値で保存された、現在の配列arrayを取り出す
                  if UserDefaults.standard.object(forKey: "add") != nil{
                      resultArray = UserDefaults.standard.object(forKey: "add") as! [String]
                  }

                 //tableViewを更新
                               tableView.reloadData()
      
    
    }
    
    
    
    
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
