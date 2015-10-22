//
//  TaskManager.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import Foundation




class TaskManager{

    
    var toDoArray = [TodoObject]()

    
func addTodo(todo:TodoObject){
    toDoArray.append(todo)
}

func removeTodo(name : String)-> Bool{
    var x :Bool = false
    
    while findByName(name) != -1{
    if findByName(name) != -1{
      toDoArray.removeAtIndex(findByName(name))
      x = true
    }
}
    return x
    //return false
}

func findByName(name: String) -> Int{
    var index:Int = 0
    for x in toDoArray{
        if x.ime == name{
           return index
        }
        index++
    }
    return -1
}
    
    func getSizeArray()->String{
        return (String(toDoArray.count))
    }
}