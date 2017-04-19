//
//  SecondScreenViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 3/30/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit
import WebKit

class SecondScreenViewController: UIViewController,WKNavigationDelegate {
    
    var addressString = "test"

    //@IBOutlet weak var myWebView: UIWebView!
    var webView : WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let localfilePath = Bundle.main.url(forResource: addressString, withExtension: "html")
        let myRequest = NSURLRequest(url: localfilePath!);
        
        
        //webView = WKWebView(frame: self.view.frame)
        //webView.navigationDelegate = self
        webView.load(myRequest as URLRequest)
        //self.view.addSubview(webView)
        //self.view.sendSubview(toBack: webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if navigationAction.navigationType == .linkActivated  {
            let newURL = navigationAction.request.url
            if newURL?.scheme == "inapp"{
                if newURL?.host == "contactForm"{
                    performSegue(withIdentifier: "searchContact",sender: self)
                    //print("click contact")
                }
            }
            decisionHandler(.allow)
          
        } else {
            //print("not a user click")
            decisionHandler(.allow)
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
