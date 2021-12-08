//
//  DatabaseService.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-08.
//

import Foundation
import SQLite3

class DatabaseService
{
    public static var db:OpaquePointer?
    private let dbPath:String
    
    init() {
        self.dbPath="todoApp.sqlite"
        
        // connect to DB
        
        do{
            let fileURL =  try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(self.dbPath)
            
            var db:OpaquePointer?=nil
            
            if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
                print("Database Connected \(dbPath)")
                DatabaseService.db = db
                self.createTables()
            }
            
            
        }catch let error{
            print(error.localizedDescription)
        }
        
    }
    
  
    
    func createTables(){
        // create task table
        let taskQuery = "CREATE TABLE IF NOT EXISTS tasks(id INTEGER AUTO_INCREMENT PRIMARY KEY, taks TEXT, description TEXT, startAt TEXT, endsAt TEXT);"
        
        var createTaskTable:OpaquePointer?=nil
        
        if sqlite3_prepare_v2( DatabaseService.db, taskQuery, -1, &createTaskTable, nil) == SQLITE_OK {
            if sqlite3_step(createTaskTable)==SQLITE_DONE {
                    print("Task Table created")
            }else{
                print("Task table cannot created")
            }
        }else{
            print("task CREATE TABLE statement could not be prepared.")
        }
        
        sqlite3_finalize(createTaskTable
        )
        
    }
    
    
}
