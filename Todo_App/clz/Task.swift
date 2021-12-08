//
//  Task.swift
//  Todo_App
//
//  Created by Dilshan Harendra Perera on 2021-12-08.
//

import Foundation

class Task{
   private var task:String, description:String, startAt:String, endsAt:String, id:Int!=nil
    
    init(task:String, description:String, startAt:String, endsAt:String) {
        
        self.task=task
        self.description=description
        self.startAt=startAt
        self.endsAt=endsAt
    }
    init(id:Int, task:String, description:String, startAt:String, endsAt:String) {
        self.id=id
        self.task=task
        self.description=description
        self.startAt=startAt
        self.endsAt=endsAt
    }
    
    func getId() -> Int {
        guard self.id == nil else {
            return -1
        }
        return self.id
    }
    
    func getTask() ->String {
        return self.task
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getStartAt() -> String{
        return self.startAt
    }
    
    func getEndAt() -> String{
        return self.endsAt
    }
    
    
    
}
