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
    @IBOutlet var from:UITextField!
    @IBOutlet var to:UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTask(){
        print(task!.text ?? "")
        print(from!.text ?? "")
        print(to!.text ?? "")
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
