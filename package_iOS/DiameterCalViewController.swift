//
//  DiameterCalViewController.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

class DiameterCalViewController: UIViewController {

    @IBOutlet var diaCal_plasmaInput : UITextField!
    @IBOutlet var calculate1: UIButton!
    @IBOutlet var calculate2: UIButton!
    @IBOutlet var diaCal_result: UILabel!
    @IBOutlet var diaCal_ratio: UILabel!
    @IBOutlet var diaCal_ratioInput: UITextField!
    @IBOutlet var resultAgain : UILabel!
    @IBOutlet var calculateAgain: UIButton!
    
    let diaCalResult = DiameterCalModel(plasma_reso: 0)
    var diameter : Double!
    
    //alert func if on user Input
    func showNoInputAlert() {
        let alertController = UIAlertController(title: "Input Error", message: "Please check: 1. The input shouldn't be empty.\n 2. The input should be greater than 512. ", preferredStyle:UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //alert if the diameter calculated is less than 35nm
    func showSmallAlert() {
        let alertController = UIAlertController(title: "The diameter calculated is less than 35 nm", message: "Please enter the Ratio of the absorbance of GNPs at the surface plasma resonance peak to the absorbance at 450 nm. Do you wish to continue?", preferredStyle:UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: { (alertController : UIAlertAction!) in (self.refreshUI()) }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func refreshUI(){
        diaCal_result.text = ""
        diaCal_ratio.hidden = false
        diaCal_ratioInput.hidden = false
        calculate1.hidden = true
        calculate2.hidden = false
        diaCal_ratioInput.hidden = false
        calculateAgain.hidden = true
    }
    
    @IBAction func diaCalTapped(sender : AnyObject){
        if (diaCal_plasmaInput.text == "" || Double((diaCal_plasmaInput.text! as NSString).doubleValue)<=512){    //if there is no input data
            showNoInputAlert()
        }else{
            diaCalResult.plasma_reso = Double((diaCal_plasmaInput.text! as NSString).doubleValue)
            diameter = diaCalResult.diaCalEq10()
            if diaCalResult.checkSize(diameter){
                showSmallAlert()
            }else{
                diaCal_result.text = String(format:"%.5f", diameter) + " " + "nm"
                calculateAgain.hidden = false
            }
        }
    }
    
    //calculate for particle whose diameter less than 35 nm
    @IBAction func smallDiaCal(sender : AnyObject){
        
        diameter = diaCalResult.diaClaEq11(Double((diaCal_ratioInput.text! as NSString).doubleValue))
        
        resultAgain.text = String(format:"%.5f", diameter) + " " + "nm"
        calculateAgain.hidden = false
    }
    
    @IBAction func calAgain(){
        calculateAgain.hidden = true
        calculate2.hidden = true
        resultAgain.text = ""
        diaCal_ratioInput.hidden = true
        diaCal_ratio.hidden = true
        calculate1.hidden  = false
        diaCal_plasmaInput.text = ""
        diaCal_result.text = ""
    }
    
    @IBAction func viewTapped(sender : AnyObject){
        diaCal_plasmaInput.resignFirstResponder()
        diaCal_ratioInput.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .Default
        
        // change colour of background
        let background = CAGradientLayer().backgroundcolour()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.yellowColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
        //change the colour of navigation bar
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
