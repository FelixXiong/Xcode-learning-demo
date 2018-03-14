//
//  AddNewItemViewController.swift
//  ToDoDemo
//
//  Created by Felix on 2018/3/10.
//  Copyright © 2018年 FelixXiong. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {

    @IBOutlet weak var NewItemITextField: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    
    @IBAction func AddButtontapped(_ sender: Any) {
        
        if (NewItemITextField.text != nil)
    {
        TodoItem.append(NewItemITextField.text!)
        NewItemITextField.text = ""
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
