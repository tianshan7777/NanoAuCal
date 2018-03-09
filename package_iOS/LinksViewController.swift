//
//  LinksViewController.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

class LinksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .Default
        // Do any additional setup after loading the view.
        
        // change colour of background
        let background = CAGradientLayer().backgroundcolour()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.yellowColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
        //change the colour of navigation bar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func webTapped(sender : AnyObject){
        UIApplication.sharedApplication().openURL(NSURL(string: "http://www.ntk-thanh.co.uk/")!)
    }
    
    @IBAction func paperTapped(sender : AnyObject){
        UIApplication.sharedApplication().openURL(NSURL(string: "http://pubs.acs.org/doi/pdf/10.1021/ac0702084")!)
    }
    
    @IBAction func tableTapped(sender : AnyObject){
        UIApplication.sharedApplication().openURL(NSURL(string: "http://pubs.acs.org/doi/suppl/10.1021/ac0702084")!)
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
