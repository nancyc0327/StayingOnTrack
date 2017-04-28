//
//  FirstScreenViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 4/19/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    let data = SubDirModel()

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareButton()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Staying On Track"
    }
    
    private func prepareButton(){
        button1.layer.cornerRadius = 4
        button2.layer.cornerRadius = 4
        button3.layer.cornerRadius = 4
        button4.layer.cornerRadius = 4
        button5.layer.cornerRadius = 4
        button6.layer.cornerRadius = 4
        button7.layer.cornerRadius = 4
        button8.layer.cornerRadius = 4
        button9.layer.cornerRadius = 4
        button10.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //        let selectedRow = (tableView.indexPathForSelectedRow?.row)!
        //print("segue:"+segue.identifier!)
        
        //print(sender.debugDescription)
        
        //let button: UIButton = sender as! UIButton

        if segue.identifier == "NSupport"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Support Growth and Learning")
            vc.title = "Support Growth and Learning"
            //let button: UIButton = sender as! UIButton
            //vc.color = button.backgroundColor
        }
        if segue.identifier == "NMilestones"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Developmental Milestones by Age")
            vc.title = "Developmental Milestones by Age"
            //let button: UIButton = sender as! UIButton
            //vc.color = button.backgroundColor

        }
        if segue.identifier == "NHealthy"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Keep Your Child Healthy")
            vc.title = "Keep Your Child Healthy"
            //let button: UIButton = sender as! UIButton
            //vc.color = button.backgroundColor

        }
        if segue.identifier == "NSafe"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Keep Your Child Safe")
            vc.title = "Keep Your Child Safe"
            //let button: UIButton = sender as! UIButton
            //vc.color = button.backgroundColor

        }
        if segue.identifier == "NQualityChildCare"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "Quality-Child-Care"
            vc.title = "Choosing Quality Child Care"
        }
        if segue.identifier == "Kindergarten"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Kindergarten")
            vc.title = "Kindergarten"
            //let button: UIButton = sender as! UIButton
            //vc.color = button.backgroundColor

        }
        if segue.identifier == "NResources"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "resources"
            vc.title = "More Resources"
        }
        if segue.identifier == "NAbout"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "about"
            vc.title = "About EDN"
        }
        if segue.identifier == "NCredits"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "credits"
            vc.title = "Credits"
        }
    }
    

}
