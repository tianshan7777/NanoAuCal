//
//  CalMenuViewController.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

class CalMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change colour of background
        let background = CAGradientLayer().backgroundcolour()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.yellowColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
        //change the colour of navigation bar
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
