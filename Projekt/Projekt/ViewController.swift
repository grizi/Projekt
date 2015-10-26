//
//  ViewController.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addTask: UIButton!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textPriority: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPriority: UILabel!
    @IBOutlet weak var removeTask: UIButton!
    @IBOutlet weak var labelLastItem: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTask.selected = true
        removeTask.selected = true
        // Do any additional setup after loading the view, typically from a nib.
        textName.delegate = self
        textPriority.delegate = self
        
        //za default vpis iz prejsnjega zaganjanja
        if let gameName = NSUserDefaults.standardUserDefaults().objectForKey("GameName") as? String{
        textName.text = gameName
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("ENDED EDITING")
        
        if ( textField == self.textName){
            print("NAME ENDED")
        }
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
        TaskManager.taskmanager.addTodo(dogodek)
        
        label.text = TaskManager.taskmanager.getSizeArray()
        //za shranjevanje default nastavitev oz od zadnje uporabe, user preferences,...
        NSUserDefaults.standardUserDefaults().setObject(name, forKey: "GameName")
        NSUserDefaults.standardUserDefaults().synchronize()
     
       labelLastItem.text = TaskManager.taskmanager.getLastItem()
    }
        
    @IBAction func actionRemoveButton(sender: UIButton) {
        var name : String = self.textName.text! as String
        TaskManager.taskmanager.removeTodo(name)
        label.text = TaskManager.taskmanager.getSizeArray()

    }

}

