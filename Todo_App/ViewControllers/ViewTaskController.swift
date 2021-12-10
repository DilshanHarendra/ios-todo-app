//
//  ViewTaskController.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-09.
//

import UIKit

class ViewTaskController: UIViewController {
    
    @IBOutlet var taskTitle:UILabel!
    @IBOutlet var taskDescription: UITextView!
    @IBOutlet var startsAt:UILabel!
    @IBOutlet var endsAt:UILabel!
    
    var task:Task!

    override func viewDidLoad() {
        super.viewDidLoad()

        taskTitle.text=task.getTask()
        taskDescription.text=task.getDescription()
        startsAt.text=task.getStartAt()
        endsAt.text=task.getEndAt()
        
        // Do any additional setup after loading the view.
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
