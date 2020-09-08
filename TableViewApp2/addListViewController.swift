//
//  addListViewController.swift
//  TableViewApp2
//
//  Created by いわし on 2020/09/08.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class addListViewController: UIViewController {

    @IBOutlet weak var addTextField: UITextField!
  
    var array = [String]()
   
   @IBAction func addTextButton(_ sender: Any) {
    //TextViewで記入されたテキストを入れる
    
    //再度保存されている値をarrayの中に再度格納する｡
    if UserDefaults.standard.object(forKey: "add") != nil{
                         array = UserDefaults.standard.object(forKey: "add") as! [String]
                     }
    
    
    array.append(addTextField.text!)
           //キー値"array"で配列の保存
           UserDefaults.standard.set(array, forKey: "add")

           //画面を戻る
           self.navigationController?.popViewController(animated: true)
    
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
