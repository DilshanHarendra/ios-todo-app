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
            
        let insertQuery="INSERT INTO tasks (task, description, startsAt, endsAt) VALUES (?,?,?,?);"
        var insertStatement: OpaquePointer?=nil
        
        if sqlite3_prepare_v2( DatabaseService.db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            sqlite3_bind_text(insertStatement,1, (task.getTask() as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement,2, (task.getDescription() as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement,3, (task.getStartAt() as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement,4, (task.getEndAt() as NSString).utf8String, -1, nil)
         
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                message="TASK add successfull"
            }else{
               message="TASK cannot add"
            }
            
        }else{
            message = "Task INSERT statement could not be prepared"
        }
        sqlite3_finalize(insertStatement)
        
        return message
    }
    
    func getTasks() -> [Task] {
        var tasks:[Task] = []
        let selectQuery = "SELECT * FROM tasks;";
        var selectStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(DatabaseService.db, selectQuery, -1, &selectStatement, nil) == SQLITE_OK {
            if sqlite3_step(selectStatement) == SQLITE_DONE {
                print("TASK SELECT DONE")
               while sqlite3_step(selectStatement) == SQLITE_ROW {
                    let id = sqlite3_column_int(selectStatement, 0)
                    let task = String(describing: String(cString: sqlite3_column_text(selectStatement, 1)))
                    let description = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                    let startsAt = String(describing: String(cString: sqlite3_column_text(selectStatement,3)))
                    let endsAt = String(describing: String(cString: sqlite3_column_text(selectStatement,4)))
                    
                    tasks.append(Task(id: Int(id), task: task, description: description, startAt: startsAt, endsAt: endsAt))
                    print("TASK SELECT DONE")
                }
            }else{
                print("TASK cannot be read")
            }
            
        }else{
            print("Task SELECT statement could not be prepared")
        }
        sqlite3_finalize(selectStatement)
        return tasks
    }
    
    
}
