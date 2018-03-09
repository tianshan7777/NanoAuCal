//
//  DiameterCalModel.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import Foundation
import Darwin

class DiameterCalModel{
    
    var plasma_reso : Double
    
    init(plasma_reso : Double){
        self.plasma_reso = plasma_reso
    }
    
    //calculation for nomal size particle using equation 10
    func diaCalEq10() -> Double{
        let diameter : Double = log((plasma_reso - 512)/6.53) / 0.0216
        
        return diameter
    }
    
    func checkSize(diameter : Double) -> (Bool){
        if( diameter <= 35.0){
            return true
        }
        return false
    }
    
    //calculation for small(smaller than 35) particle using equation 11
    func diaClaEq11(ratio : Double) -> Double{
        let diameter : Double = exp((3.55 * ratio) - 3.11);
        
        return diameter
    }
}
