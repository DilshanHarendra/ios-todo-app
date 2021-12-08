//
//  TaskModel.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-08.
//

import Foundation
import SQLite3
class TaskModel {
    
    func createTask(task:Task) -> String {
        var message:String = ""
            
        let insertQuery="INSERT INTO taks (taks, description, startAt, endsAt) VALUES (?,?,?,?)"
        var insertStatement: OpaquePointer?=nil
        if sqlite3_prepare( DatabaseService.db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            sqlite3_bind_text(insertStatement,1, (task.getTask() as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement,2, (task.getDescription() as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement,3, (task.getStartAt() as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement,4, (task.getEndAt() as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement)==SQLITE_DONE {
                print("TASK add successfull")
                message="TASK add successfull"
            }else{
                print("TASK cannot add")
                message="TASK cannot add"
            }
            
        }else{
            print("Task INSERT statement could not be prepared")
            message = "Task INSERT statement could not be prepared"
        }
        
        
        return message
    }
}
