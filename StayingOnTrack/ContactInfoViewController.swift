//
//  ContactInfoViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 4/3/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit
import MessageUI

class ContactInfoViewController: UIViewController , MFMailComposeViewControllerDelegate {
    var contact  = ContactModel()

    @IBOutlet weak var infoTV: UITextView!
    
    @IBAction func callNumber(_ sender: UIButton) {
        guard let number = URL(string: "telprompt://" + contact.phone) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
            print("canSendMail")
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([contact.email])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        //let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        //sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let regionNumStr = "Region Number: \(contact.regionNumber)"
        let nameStr = contact.name
        let phoneStr = "Phone Number: \(contact.phone) "
        let addressStr = "Address: \(contact.address), \(contact.cityStateZip)"
        let emailStr = "Email: \(contact.email)"
        
        let textString = "\(regionNumStr)\n\n\(nameStr)\n\n\(phoneStr)\n\n\(addressStr)\n\n\(emailStr)\n"
        
        let attrText = NSMutableAttributedString(string: textString)
        
        let regionFont = UIFont.systemFont(ofSize: 24)
        let nameFont = UIFont.systemFont(ofSize: 24)
        let phoneFont = UIFont.systemFont(ofSize: 17)
        let addressFont = UIFont.systemFont(ofSize: 17)
        let emailFont = UIFont.systemFont(ofSize: 17)
        
        //  Convert textString to NSString because attrText.addAttribute takes an NSRange.
        let regionRange = (textString as NSString).range(of: regionNumStr)
        attrText.addAttribute(NSFontAttributeName, value: regionFont, range: regionRange)
        let nameRange = (textString as NSString).range(of: nameStr)
        attrText.addAttribute(NSFontAttributeName, value: nameFont, range: nameRange)
        let phoneRange = (textString as NSString).range(of: phoneStr)
        attrText.addAttribute(NSFontAttributeName, value: phoneFont, range: phoneRange)
        let addressRange = (textString as NSString).range(of: addressStr)
        attrText.addAttribute(NSFontAttributeName, value: addressFont, range: addressRange)
        let emailRange = (textString as NSString).range(of: emailStr)
        attrText.addAttribute(NSFontAttributeName, value: emailFont, range: emailRange)
        
        infoTV.attributedText = attrText

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
