//
//  ViewController.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tasks:[String]=["task one","task 2","task 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title="Tasks"
        tableView.delegate=self
        tableView.dataSource=self
    }
    
    @IBAction func showAddTask(){
        let vc = storyboard?.instantiateViewController(identifier: "addTask") as! AddTaskViewController
        vc.title = "Add New Task"
        navigationController?.pushViewController(vc, animated:true)
    }
    


}
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    
}


