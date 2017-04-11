//
//  FirstScreenTableViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 3/30/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit

class FirstScreenTableViewController: UITableViewController {
    let data = SubDirModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //print ("load tvc")
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
        if segue.identifier == "Support"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Support Growth and Learning")
        }
        if segue.identifier == "Milestones"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Developmental Milestones by Age")
        }
        if segue.identifier == "Healthy"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Keep Your Child Healthy")
        }
        if segue.identifier == "Safe"{
            let vc = segue.destination as! SecondScreenTableViewController
            vc.pageList = data.getSubDir(mainDirName: "Keep Your Child Safe")
        }
        if segue.identifier == "QualityChildCare"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "Quality-Child-Care"
        }
        if segue.identifier == "Kindergarten"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "Kindergarten"
        }
        if segue.identifier == "Resources"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "resources"
        }
        if segue.identifier == "About"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "about"
        }
        if segue.identifier == "Credits"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = "credits"
        }
    }
 

}
