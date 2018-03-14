//
//  TodolistViewController.swift
//  ToDoDemo
//
//  Created by Felix on 2018/3/10.
//  Copyright © 2018年 FelixXiong. All rights reserved.
//

import UIKit

var TodoItem:[String] = []

class TodolistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var ToDoListTableView: UITableView!
    @IBOutlet weak var EditButton: UIBarButtonItem!

    @IBAction func EditButtontapped(_ sender: Any) {
        ToDoListTableView.isEditing = !ToDoListTableView.isEditing
        switch ToDoListTableView.isEditing{
        case true:
            editButtonItem.title = "done"
        case false:
            editButtonItem.title = "edit"
        }
    }
    
    //实现基本TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ToDoListTableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        //实现输入字符为todoitem
        cell.textLabel?.text = TodoItem[indexPath.row]
        
        return cell
    }
    
    
    //编辑模式
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        ToDoListTableView.setEditing(editing, animated: true)
    }
    
    //移动行
    //允许重新排序单元格，如果返回否则无法重新排序,编辑模式中出现排序行d的图标
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
                                             //从行～到行
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = TodoItem.remove(at: (sourceIndexPath as NSIndexPath).row)
        TodoItem.insert(todo, at: (destinationIndexPath as NSIndexPath).row)
        
    }
    
    
    //删除行
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //从数据源中删除行
            TodoItem.remove(at:indexPath.row)
            ToDoListTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //实现上拉缩小大标题，大标题显示模式：自动(搜索出现列表功能未实现)
        navigationItem.largeTitleDisplayMode = .automatic
        //增加搜索框
        let searchController = UISearchController(searchResultsController:nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false//上拉保留搜索框，即不隐藏
    }
    
    //重载数据
    override func viewDidAppear(_ animated: Bool) {
        ToDoListTableView.reloadData()
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
