//
//  SecondScreenViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 3/30/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController,UIWebViewDelegate {
    
    var addressString = "test"

    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let localfilePath = Bundle.main.url(forResource: addressString, withExtension: "html")
        let myRequest = NSURLRequest(url: localfilePath!);
        myWebView.loadRequest(myRequest as URLRequest)
        //print("load vc"+addressString)
        myWebView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        switch navigationType {
        case .linkClicked:
            // Open links in Safari
            guard let url = request.url else { return true }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // openURL(_:) is deprecated in iOS 10+.
                UIApplication.shared.openURL(url)
            }
            return false
        default:
            // Handle other navigation types...
            return true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
