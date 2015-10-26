//
//  TaskManager.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import Foundation

extension Method{}

func  get(status : Stanje) -> [TodoObject] {
    
    var x = [TodoObject]()
    for y in (NSUserDefaults.standardUserDefaults().objectForKey("toDoArray") as? [TodoObject])!{
        if y.stanje == status{
            x.append(y)
        }
    }
    return x
}




class TaskManager{
    static let taskmanager =  TaskManager()
    lazy var toDoArray = [TodoObject]()
   // = (NSUserDefaults.standardUserDefaults().objectForKey("toDoArray") as? [TodoObject])!
    
    init()
    {
        loadToDoArray()
    }
    
 func addTodo(todo:TodoObject){
    toDoArray.append(todo)
    updateToDoArray2Defaults()

}

 func removeTodo(name : String)-> Bool{
    var x :Bool = false
    
    while findByName(name) != -1{
    if findByName(name) != -1{
      toDoArray.removeAtIndex(findByName(name))
      x = true
    }
}
    updateToDoArray2Defaults()
    return x
    //return false
}

 func findByName(name: String) -> Int{
  /*  if toDoArray.count == 0
    {
       if let toDoArray_:[TodoObject] = NSUserDefaults.standardUserDefaults().objectForKey("toDoArray") as? [TodoObject]
           {
            self.toDoArray = toDoArray_
        }
    }*/
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
    
  func updateToDoArray2Defaults(){
    let data = NSKeyedArchiver.archivedDataWithRootObject(toDoArray)
    NSUserDefaults.standardUserDefaults().setObject(data, forKey: "toDoArray")
    NSUserDefaults.standardUserDefaults().synchronize()
    }
    
  func getLastItem() ->String{
            return (toDoArray.last?.description_())!
    }
    
    
    func loadToDoArray(){
        let toDoArrayFromNsUserDef = NSUserDefaults.standardUserDefaults().objectForKey("toDoArray") as? NSData
        
        if let toDoArrayFromNsUserDef = toDoArrayFromNsUserDef {
            let toDoArray_q = NSKeyedUnarchiver.unarchiveObjectWithData(toDoArrayFromNsUserDef) as? [TodoObject]
            
            if let toDoArray_q = toDoArray_q {
                toDoArray = toDoArray_q
            }
            
        }
    }
    
}