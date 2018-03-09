//
//  ConcentrationCalViewController.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

class ConcentrationCalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //change the colour of status bar
        UIApplication.sharedApplication().statusBarStyle = .Default
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
    
    //outlets of concentration calculation
    @IBOutlet var concCal_diaInput: UITextField!
    @IBOutlet var concCal_opticalDen: UITextField!
    @IBOutlet var concResult: UILabel!
    @IBOutlet var calAgain: UIButton!
    @IBOutlet var massResult: UILabel!
    @IBOutlet var molesResult: UILabel!
    @IBOutlet var calculate: UIButton!
    
    //function to show alert when input errors occur in concentration calculation
    func showConcAlert() {
        let alertController = UIAlertController(title: "Input Error", message: "Please check: \n1. The input diameter should between 2 nm and 100 nm. \n 2.The unit of input diameter should be nm.", preferredStyle:UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    let concCalResult = ConcentrationCalModel(diameter: 0, opticalDen: 0)
    var concentration : Double!
    
    //action of concentration calculation
    @IBAction func concCalTapped(sender : AnyObject){
        concCalResult.diameter = Int((concCal_diaInput.text! as NSString).intValue)
        concCalResult.opticalDen = Double((concCal_opticalDen.text! as NSString).doubleValue)
        
        if concCalResult.checkDiameter() {
            showConcAlert()
        }else{
            concentration = concCalResult.concCal()
            
            concResult.text = "The molar particle concentration:" + String(format:"%.2f", concentration) + "nM"
            massResult.text = "The mass of GNPs:" + String(format:"%.4f", concCalResult.massCal(concentration)) + "mg/ml"
            molesResult.text = "The molar concentration of gold per litre:" + String(format:"%.4f",concCalResult.molesCal(concentration)) + "mM"
        }
        
        calAgain.hidden = false
        calculate.hidden = true
    }
    
    //fuc for gesture tapped
    @IBAction func calAgainTapped(sender : AnyObject){
        concCal_diaInput.text = ""
        concCal_opticalDen.text = ""
        calculate.hidden = false
        calAgain.hidden = true
        massResult.text = ""
        molesResult.text = ""
        concResult.text = ""
    }
    
    @IBAction func viewTapped(sender : AnyObject){
        concCal_diaInput.resignFirstResponder()
        concCal_opticalDen.resignFirstResponder()
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
