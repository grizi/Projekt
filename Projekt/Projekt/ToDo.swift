//
//  ToDo.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import Foundation

class TodoObject
{
    
    var ime:String
    var datum = NSDate()
    var datumSpremembe = NSDate()
    var prioriteta:Priority = Priority.NIZKA
    var tip:Tip = Tip.KNJIGE
    var stanje:Stanje = Stanje.ZASEBNO
    
    
    init(ime:String, tip : Tip, prioriteta : Priority, stanje : Stanje)
    {
        self.ime = ime
        self.datum = NSDate()
        self.prioriteta = prioriteta
        self.stanje = stanje
        
        
    }
    
    func description()
    {
        print( " \(self.datum), \(self.tip), \(self.prioriteta), \(self.ime), \(self.stanje)")
        
    }
    
    
}
