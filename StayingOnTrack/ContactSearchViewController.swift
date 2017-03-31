//
//  ContactSearchViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 3/31/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit

class ContactSearchViewController: UIViewController {

    @IBOutlet weak var mySearchButton: UIButton!
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareButton()
        myTextView.text = "temp"
        prepareTextView()
        
    }
    
    private func prepareTextView()
    {
        let smallTextString = "If you are outside of Nebraska you can find your state's Part C Coordinator at "
        let linkTextString = "ECTACenter"
        let textString = "\n\(smallTextString)\(linkTextString)"
        
        let attrText = NSMutableAttributedString(string: textString)
        
        let smallFont = UIFont.systemFont(ofSize: 17)
        
        //  Convert textString to NSString because attrText.addAttribute takes an NSRange.
        let smallTextRange = (textString as NSString).range(of: smallTextString)
        let linkTextRange = (textString as NSString).range(of: linkTextString)
        attrText.addAttribute(NSFontAttributeName, value: smallFont, range: smallTextRange)
        
        //let linkString = NSMutableAttributedString(string: string)
        attrText.addAttribute(NSLinkAttributeName, value: NSURL(string: "http://www.nectac.org/contact/ptccoord.asp")!, range: linkTextRange)
        attrText.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 17), range: linkTextRange)
        attrText.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: linkTextRange)
        
        myTextView.attributedText = attrText
    }
    
    private func prepareButton()
    {
        mySearchButton.backgroundColor = .clear
        mySearchButton.layer.cornerRadius = 5
        mySearchButton.layer.borderWidth = 1
        mySearchButton.layer.borderColor = UIColor.black.cgColor

    }
    
    @IBAction func mySearchButton(_ sender: Any) {
        let zip = myTextView.text
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
