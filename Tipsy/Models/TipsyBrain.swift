//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Артём Голынец on 10.02.23.
//

import Foundation


struct TipsyBrain {
    
    var sum : Double
    
    var tip : Double
    
    var numberOfPeople : Double
    
    func getTotal() -> String{
        return String(format: "%.2f", (sum + sum * tip) / numberOfPeople)
    }
    
    func getSettings() -> String{
        return "\(tip * 100)%"
    }
}
