//
//  ViewController.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addTask: UIButton!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textPriority: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPriority: UILabel!
    @IBOutlet weak var removeTask: UIButton!
    
    
    var taskManager : TaskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionAddButton(sender: AnyObject) {
        var name : String = self.textName.text! as String
        var priority :Priority
        
        switch self.textPriority.text! as String {
        
        case "VISOKA":
            priority = Priority.VISOKA
            
        case  "SREDNJA":
            priority = Priority.SREDNJA
        
        case "NIZKA":
            priority = Priority.NIZKA
            
        default:
            priority = Priority.NIZKA
        }
        
        var dogodek: TodoObject = TodoObject.init(ime: name, tip: Tip.DOGODEK, prioriteta: priority, stanje: Stanje.ZASEBNO)
        taskManager.addTodo(dogodek)
        label.text = taskManager.getSizeArray()
    }
        
    @IBAction func actionRemoveButton(sender: UIButton) {
        var name : String = self.textName.text! as String
        taskManager.removeTodo(name)
        label.text = taskManager.getSizeArray()

    }

}

