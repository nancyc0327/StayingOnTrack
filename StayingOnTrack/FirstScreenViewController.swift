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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if segue.identifier == "NSupport"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Support Growth and Learning")
        }
        if segue.identifier == "NMilestones"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Developmental Milestones by Age")
        }
        if segue.identifier == "NHealthy"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Keep Your Child Healthy")
        }
        if segue.identifier == "NSafe"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Keep Your Child Safe")
        }
        if segue.identifier == "NQualityChildCare"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "Quality-Child-Care"
        }
        if segue.identifier == "Kindergarten"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Kindergarten")
        }
        if segue.identifier == "NResources"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "resources"
        }
        if segue.identifier == "NAbout"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "about"
        }
        if segue.identifier == "NCredits"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "credits"
        }
    }
    

}
