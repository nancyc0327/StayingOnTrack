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
    var webView : WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
        //self.navigationItem.title = titleStr
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
        //let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        //newBackButton.image = UIImage(named: "UJ0uL.png")
        //self.navigationItem.leftBarButtonItem = newBackButton
        testBackbutton()
        
        
        
    }
    
    private func testBackbutton()
    {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(self.back(sender:)), for: .touchUpInside)
        
        let imageView = UIImageView(frame: CGRect(x: -5, y: 0, width: 30, height: 28))
        imageView.image = UIImage(named: "UJ0uL.png")
        let label = UILabel(frame: CGRect(x: 30, y: 0, width: 50, height: 30))
        label.text = "Back"
        label.textColor = UIColor.blue
        let buttonView = UIView(frame: CGRect(x: -5, y: 0, width: 80, height: 30))
        button.frame = buttonView.frame
        buttonView.addSubview(button)
        buttonView.addSubview(imageView)
        buttonView.addSubview(label)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonView)
        
      /*  let containView = UIView(frame: CGRect(x:0, y:0,width:80, height:40))
        
        let imageview = UIImageView(frame: CGRect(x:0, y:10,width:30, height:30))
        imageview.image = UIImage(named: "UJ0uL.png")
        imageview.contentMode = UIViewContentMode.scaleAspectFill
        containView.addSubview(imageview)
        
        let label = UILabel(frame: CGRect(x:30, y:0,width:50, height:40))
        label.text = "Back"
        label.textAlignment = NSTextAlignment.center
        containView.addSubview(label)
        
        let backButton = UIBarButtonItem(customView: containView)
        backButton.style = UIBarButtonItemStyle.plain
        backButton.targetForAction(#selector(self.back(sender:)), withSender: self)
        
        self.navigationItem.leftBarButtonItem = backButton
        */
    
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
    
   /* func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    */

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if webView != self.webView {
            decisionHandler(.allow)
            return
        }
        
        let app = UIApplication.shared
        if let url = navigationAction.request.url {
            // Handle target="_blank"
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            
            // Handle phone and email links
            if url.scheme == "tel" || url.scheme == "mailto" {
                if app.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        app.open(url as URL, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                    decisionHandler(.cancel)
                    return
                }
            }
            
            if url.scheme == "inapp"{
                if url.host == "contactForm"{
                    performSegue(withIdentifier: "searchContact",sender: self)
                    //print("click contact")
                    decisionHandler(.cancel)
                    return
                }
            }
            
            
            decisionHandler(.allow)
        }
    }
 /*
     
     if navigationAction.navigationType == .linkActivated  {
     
     let newURL = navigationAction.request.url
     
     if newURL?.scheme == "inapp"{
     if newURL?.host == "contactForm"{
     performSegue(withIdentifier: "searchContact",sender: self)
     //print("click contact")
     }
     decisionHandler(.allow)
     }
     if newURL?.scheme == "tel" || newURL?.scheme == "mailto"  {
     if UIApplication.shared.canOpenURL(newURL!) {
     UIApplication.shared.open(newURL! as URL, options: [:], completionHandler: nil)
     decisionHandler(.cancel)
     }
     else{
     decisionHandler(.allow)
     }
     }
     else{
     decisionHandler(.allow)
     }
     
     } else {
     //print("not a user click")
     decisionHandler(.allow)
     }

 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
