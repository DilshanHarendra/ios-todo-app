//
//  ViewController.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-07.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var dbService:DatabaseService!
    private var taskModel:TaskModel!
    private var tasks:[Task]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title="Tasks"
        tableView.delegate=self
        tableView.dataSource=self
        
        // connect to database
        
        self.dbService = DatabaseService()
        self.taskModel = TaskModel()
        self.fetchTasks()
    }
    
    @IBAction func showAddTask(){
        let vc = storyboard?.instantiateViewController(identifier: "addTask") as! AddTaskViewController
        vc.title = "New Task"
        vc.update={
            DispatchQueue.main.async {
                self.fetchTasks()
            }
        }
        navigationController?.pushViewController(vc, animated:true)
    }
    
    func fetchTasks() {
        self.tasks.removeAll()
        self.tasks = self.taskModel.getTasks()
        tableView.reloadData()
    }


}
extension MainController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(identifier: "viewTask") as! ViewTaskController
        vc.title = "View Task"
        vc.task=tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated:true)
    }
    
  
    
}

extension MainController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row].getTask()
        
        return cell
    }
    
    
}


