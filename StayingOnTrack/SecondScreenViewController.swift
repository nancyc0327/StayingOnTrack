//
//  SecondScreenViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 3/30/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit
import WebKit

class SecondScreenViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
    var addressString = "test"

    //@IBOutlet weak var myWebView: UIWebView!
    var webView : WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
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
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        if (self.webView.canGoBack) {
            self.webView.goBack()
        }
        else {
            _ = navigationController?.popViewController(animated: true)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func insertContentsOfCSSFile(into webView: WKWebView) {
        
       if  let path = Bundle.main.path(forResource: "style", ofType: "css")
        {
            let cssString = try! String(contentsOfFile: path).trimmingCharacters(in: .whitespacesAndNewlines)
            let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
            webView.evaluateJavaScript(jsString, completionHandler: nil)

        }
        else {
                return
        }
    }
    func insertCSSString(into webView: WKWebView) {
        let cssString = "body { font-size: 50px; color: #f00 }"
        let jsString = "var style = document.createElement('style'); style.innerHTML = '\(cssString)'; document.head.appendChild(style);"
        webView.evaluateJavaScript(jsString, completionHandler: nil)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //insertCSSString(into: webView) // 1
        insertContentsOfCSSFile(into: webView) // 2
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        
        if navigationAction.navigationType == .linkActivated  {
            
            let newURL = navigationAction.request.url
            
            if newURL?.scheme == "inapp"{
                if newURL?.host == "contactForm"{
                    performSegue(withIdentifier: "searchContact",sender: self)
                    //print("click contact")
                }
                decisionHandler(.allow)
            }
/*            else if UIApplication.shared.canOpenURL(newURL!) {
                UIApplication.shared.open(newURL! as URL, options: [:], completionHandler: nil)
                //print(newURL!)
                //print("Redirected to browser. No need to open it locally")
                decisionHandler(.cancel)
            }*/
            else{
                decisionHandler(.allow)
            }
          
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
