//
//  SecondScreenTableViewController.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 4/5/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import UIKit

class SecondScreenTableViewController: UITableViewController {
    
    var pageList = [PageInfo]()
    //var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pageList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath) as UITableViewCell

        // Configure the cell...
        let row = indexPath.row
        cell.textLabel?.text = pageList[row].secondDirName
        
        if (row % 2) == 0  { //alternate rowcolors
            cell.backgroundColor = UIColor(red:0.93, green:1.00, blue:0.87, alpha:1.0)
            //cell.textLabel?.textColor = UIColor.black
        }
        //cell.alpha = 0.75
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let selectedRow = (tableView.indexPathForSelectedRow?.row)!
        //let keys = Array(fileDict.keys)
        
        if segue.identifier == "ShowPage"{
            let vc = segue.destination
                as! SecondScreenViewController
            vc.addressString = pageList[selectedRow].pageFileName
        }
    }

}
