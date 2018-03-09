//
//  ConcentrationCalModel.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

class ConcentrationCalModel: NSObject {
    var diameter : Int
    var opticalDen : Double
    let epsilon_values : [Double] = [0, 0, 4.25, 1.49, 36.2, 72.0, 126.0,
                                     203.0, 307.0, 443.0, 615.0, 827.0,
                                     1090.0, 1390.0, 1760.0, 2180.0, 2670.0, 3240.0, 3870.0,
                                     4600.0, 5410.0, 6310.0, 7310.0, 8420.0, 9640.0,
                                     11000.0, 12400.0, 14000.0, 15800.0, 17600.0, 19600.0,
                                     21800.0, 24100.0, 26600.0, 29300.0, 32100.0, 35200.0,
                                     38400.0, 41800.0, 45400.0, 49200.0, 53200.0, 57400.0,
                                     61800.0, 66500.0, 71300.0, 76500.0, 81800.0, 87400.0,
                                     93200.0, 99200.0, 106000.0, 112000.0, 119000.0, 126000.0,
                                     133000.0, 141000.0, 148000.0, 157000.0, 165000.0, 173000.0,
                                     182000.0, 191000.0, 200000.0, 210000.0, 219000.0, 229000.0,
                                     240000.0, 250000.0, 261000.0, 271000.0, 282000.0, 293000.0,
                                     305000.0, 316000.0, 328000.0, 340000.0, 362000.0, 364000.0,
                                     377000.0, 389000.0, 402000.0, 414000.0, 427000.0, 440000.0,
                                     453000.0, 465000.0, 478000.0, 491000.0, 504000.0, 517000.0,
                                     530000.0, 543000.0, 556000.0, 569000.0, 582000.0, 594000.0,
                                     607000.0, 619000.0, 631000.0, 644000.0]
    
    init(diameter : Int, opticalDen : Double){
        self.diameter = diameter
        self.opticalDen = opticalDen
    }
    
    func checkDiameter() -> Bool{
        if((self.diameter > 100) || (self.diameter < 2)){
            return true
        }
        return false
    }
    
    func concCal() -> Double{
        
        let epsilon : Double = epsilon_values[diameter] * pow(10.0,5.0)
        
        let concentration : Double = (opticalDen * pow(10.0,9.0)) / epsilon
        
        return concentration
        
    }
    
    func massCal(concentration : Double) -> (Double){
        // Calculating the volume (nm^3)
        let volume : Double = pow((Double(self.diameter)/2.0),3.0) * (4/3) * M_PI;
        // Calculate the mass in (g)
        let mass : Double = 19.32 * volume * pow(10.0, -21.0);
        // Calculate the mass of GNP per ml (mg/ml)
        let mass_per_ml : Double = concentration * pow(10.0,-9.0) * 6.022 * pow(10.0, 23.0) * mass
        
        return mass_per_ml
    }
    
    func molesCal(concentration : Double) -> (Double){
        let mol_per_l : Double = concentration * 196.96657 * pow(10,3) * pow(10,-9) * pow(10,3)
        
        return mol_per_l
    }
}
