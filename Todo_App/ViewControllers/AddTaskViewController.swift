//
//  AddTaskViewController.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-07.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet var task:UITextField!
    @IBOutlet var taskDescription: UITextView!
    @IBOutlet var startsAt:UITextField!
    @IBOutlet var endsAt:UITextField!
    
    private var taskModel:TaskModel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        taskModel = TaskModel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTask(){
        let newTask:Task = Task(task: task.text!, description: taskDescription.text!, startAt: startsAt.text!, endsAt: endsAt.text!)
        
        let message:String = self.taskModel.createTask(task: newTask)
        print(message)
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
