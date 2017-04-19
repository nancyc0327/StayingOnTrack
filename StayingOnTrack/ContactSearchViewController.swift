//
//  ContactSearchViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 3/31/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit

class ContactSearchViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var myZipField: UITextField!
    
    @IBOutlet weak var mySearchButton: UIButton!
    
    @IBOutlet weak var myTextView: UITextView!
    
    @IBOutlet weak var myErrorLabel: UILabel!
    
    @IBAction func tapEDU(_ sender: Any) {
 //       UIApplication.shared.openURL(! as URL)
        UIApplication.shared.open(NSURL(string: "https://www.education.ne.gov/")! as URL, options: [:], completionHandler: nil)
    }
    
    
    var contact = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        self.view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
        myTextView.text = "temp"
        prepareTextView()
        myZipField.delegate = self
        myZipField.keyboardType = UIKeyboardType.numberPad
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // We ignore any change that doesn't add characters to the text field.
        // These changes are things like character deletions and cuts, as well
        // as moving the insertion point.
        //
        // We still return true to allow the change to take place.
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    @IBAction func mySearchButton(_ sender: UIButton) {

        let zip = myZipField.text
        myZipField.text = ""
        myErrorLabel.text = ""

        
        if (zip?.characters.count != 5){
            myErrorLabel.text = "Input 5 digit number for Zip code."
            return
        }
        


        let urlStr = "http://edn.ne.gov/referralLookup.php?zip="+zip!
        let url = URL(string: urlStr)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            var errMsg = ""
            if(error != nil){
                print("error")
                errMsg = (error?.localizedDescription)!
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    
                    try self.contact = ContactModel(json: json)
                        
                    OperationQueue.main.addOperation {
                            self.performSegue(withIdentifier: "ContactInfo",
                                                  sender: self)
                    }

                }catch let error as NSError{
                    print(error)
                    errMsg = "Error: Input valide zip code"
                }catch let err as SerializationError{
                    switch err {
                        case .invalidZip(let val):
                            print("Error: Input valide zip code")
                            errMsg = val
                        case .missing(let val):
                            print("Contact name is missing")
                            errMsg = val
                    }
                    print (err)
                }
            }
            // Used to shorten loading time
            DispatchQueue.main.sync(execute: {
                // Update UI here
                self.myErrorLabel.text = errMsg
            })
        }).resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactInfo"{
            let vc = segue.destination as! ContactInfoViewController
            
            vc.contact = self.contact
            vc.navigationItem.title = "Contact Infomation"
        }
    }

}
