//
//  CAGradient.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

//set background colour

extension CAGradientLayer {
    func backgroundcolour() -> CAGradientLayer{
        let topColour = UIColor(red:(220/255.0), green:(220/255.0), blue:(220/255.0), alpha:0.7)
        let bottomColour = UIColor(red:(211/255.0), green:(211/255.0), blue:(211/255.0), alpha: 0.7)
        let gradientColours : [CGColor] = [topColour.CGColor, bottomColour.CGColor]
        let gradientLocations = [0.0, 1.25]
        
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColours
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }
}
