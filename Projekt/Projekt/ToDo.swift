//
//  ToDo.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import Foundation

extension Equatable{}
func == (lhs: TodoObject, rhs:TodoObject) -> Bool {
    if lhs.ime == rhs.ime && lhs.datum == rhs.datum && lhs.datumSpremembe == rhs.datumSpremembe && lhs.prioriteta == rhs.prioriteta && lhs.tip == rhs.tip && lhs.stanje == rhs.stanje{
        return true
    }else{
    return false
    }
}


class TodoObject: NSObject
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
   
    func description_() ->String
    {
 
        return ( " \(formatDate(datum)),\n \(self.tip),\n \(self.prioriteta),\n \(self.ime),\n \(self.stanje)")
        
    }
    
    required init(coder aDecoder: NSCoder) {
        self.ime = aDecoder.decodeObjectForKey("ime") as! String
        self.datum = aDecoder.decodeObjectForKey("datum") as! NSDate
        self.datumSpremembe = aDecoder.decodeObjectForKey("datumSpremembe") as! NSDate
        self.prioriteta = Priority(rawValue:  aDecoder.decodeObjectForKey("prioriteta") as! String)!
        self.tip = Tip(rawValue: aDecoder.decodeObjectForKey("tip") as! String)!
        self.stanje = Stanje(rawValue: aDecoder.decodeObjectForKey("stanje") as! String)!
        
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(self.ime, forKey: "ime")
        aCoder.encodeObject(self.datum, forKey: "datum")
        aCoder.encodeObject(self.datumSpremembe, forKey: "datumSpremembe")
        aCoder.encodeObject(self.prioriteta.rawValue , forKey: "prioriteta")
        aCoder.encodeObject(self.tip.rawValue , forKey: "tip")
        aCoder.encodeObject(self.stanje.rawValue , forKey: "stanje")
        
    }
    
    func formatDate(datum : NSDate) -> String{
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        
        let dateString = formatter.stringFromDate(datum)
        
        return dateString
    }
    
    
}
    