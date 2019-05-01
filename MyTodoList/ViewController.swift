//
//  ViewController.swift
//  MyTodoList
//
//  Created by 坂口豪紀 on 2019/05/01.
//  Copyright © 2019 Goki Sakaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // ToDoを格納した配列
    var todoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func tapAddButton(_ sender: Any) {
        // アラードダイアログを生成
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください", preferredStyle: UIAlertController.Style.alert)
        // テキストエリアを追加
        alertController.addTextField(configurationHandler: nil)
        // OKボタンを追加
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
            // OKボタンがタップされたときの処理
            if let textField = alertController.textFields?.first{
                // ToDoの配列に入力値を挿入。先頭に挿入する
                self.todoList.insert(textField.text!, at: 0)
                
                // テーブルに行が追加されたことをテーブルに通知
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
            }
        }
        // OKボタンがタップされたときの処理
        alertController.addAction(okAction)
        
        // CANCELボタンがタップされた時の処理
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelButton)
        
        // アラートダイアログを表示
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todoList.count)
        // Todoにの配列の長さを返却する
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Storyboardで指定したtodoCell識別子を利用して再利用可能なセルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        // 行番号に合ったToDoのタイトルを取得
        let todoTitle = todoList[indexPath.row]
        // セルのラベルにToDoのタイトルをセット
        cell.textLabel?.text = todoTitle
        return cell
    }
    
    
    
    
}

