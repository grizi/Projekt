//
//  Protocols.swift
//  Projekt
//
//  Created by Stefan Voljc on 22/10/15.
//  Copyright © 2015 Stefan Voljc. All rights reserved.
//

import Foundation

struct Kvadrat : Geometrija {
    var x : Double
    var y : Double
    var sirina : Double
    var visina : Double
    
    func ploscina() -> Double {
        return sirina*visina
    }
    mutating func povecaj(faktor: Double) {
        sirina = sirina * faktor
        visina = visina * faktor
    }
}

protocol Geometrija {
    func ploscina () -> Double
    
   mutating func povecaj(faktor : Double)
    
}

func printKvadrat(){
    
    var kvadrat1 = Kvadrat(x: 1.0, y: 10.0, sirina: 30.0, visina: 30.0)
    
    var kvadrat2 = Kvadrat(x: 5.4, y: 3.4, sirina: 10.2, visina: 9.8)
    
    print("Ploscina1 \(kvadrat1.ploscina())")
       print("Ploscina2 \(kvadrat2.ploscina())")
    
    kvadrat2.povecaj(2)
       print("Ploscina2 \(kvadrat2.ploscina())")
}