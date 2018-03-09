//
//  AboutViewController.swift
//  NanoAuCal
//
//  Created by Tianshan Li on 21/04/2016.
//  Copyright © 2016 UniversityCollegeLondon. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet var scrollView: UIScrollView!
    var path = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //enable user to zoom in and out
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
        
        //add pdf path
        path = NSBundle.mainBundle().pathForResource("About", ofType: "pdf")!
        
        let url = NSURL.fileURLWithPath(path);self.webView.loadRequest(NSURLRequest(URL: url))
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.yellowColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
        //change the colour of navigation bar
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.webView
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
