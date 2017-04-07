//
//  SubDirModel.swift
//  StayingOnTrack
//
//  Created by Nan Cai on 4/4/17.
//  Copyright © 2017 Nan Cai. All rights reserved.
//

import Foundation

class PageInfo{
    var mainDirName = ""
    var secondDirName = ""
    var pageFileName = ""
    init(mainDirName:String,secondDirName:String,pageFileName:String){
        self.mainDirName = mainDirName  //primary key
        self.secondDirName = secondDirName
        self.pageFileName = pageFileName
    }
}

class SubDirModel {
    var list = [PageInfo]()
    
    func addItem(mainDirName:String,secondDirName:String,pageFileName:String){
        let pageItem = PageInfo(
            mainDirName: mainDirName,
            secondDirName: secondDirName,
            pageFileName: pageFileName)
        list.append(pageItem)
    }

    init()
    {
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"Read First",pageFileName:"disclaimer")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"0-3 Months",pageFileName:"0-3")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"3-6 Months",pageFileName:"3-6")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"6-9 Months",pageFileName:"6-9")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"9-12 Months",pageFileName:"9-12")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"12-18 Months",pageFileName:"12-18")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"19-24 Months",pageFileName:"2-yr")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"3 Years",pageFileName:"3-yr")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"4 Years",pageFileName:"4-yr")
        addItem(mainDirName:"Developmental Milestones by Age",secondDirName:"5 Years",pageFileName:"5-yr")
        
        addItem(mainDirName:"Support Growth and Learning",secondDirName:"0-18 Months",pageFileName:"Growth-Learning-0-18")
        addItem(mainDirName:"Support Growth and Learning",secondDirName:"19-24 Months",pageFileName:"Growth-Learning-18-3")
        addItem(mainDirName:"Support Growth and Learning",secondDirName:"3-5 Years",pageFileName:"Growth-Learning-3-5")
        
        addItem(mainDirName:"Keep Your Child Healthy",secondDirName:"0-18 Months",pageFileName:"Child-Health-0-18")
        addItem(mainDirName:"Keep Your Child Healthy",secondDirName:"18 Months - 3 Years",pageFileName:"Child-Health-18-3")
        addItem(mainDirName:"Keep Your Child Healthy",secondDirName:"3-5 Years",pageFileName:"Child-Health-3-5")
        
        addItem(mainDirName:"Keep Your Child Safe",secondDirName:"0-18 Months",pageFileName:"Child-Safe-0-18")
        addItem(mainDirName:"Keep Your Child Safe",secondDirName:"18 Months - 3 Years",pageFileName:"Child-Safe-18-3")
        addItem(mainDirName:"Keep Your Child Safe",secondDirName:"3-5 Years",pageFileName:"Child-Safe-3-5")
    }
    
    func getSubDir(mainDirName:String) ->[PageInfo]{
        var resultSet = [PageInfo]()
        for value in list {
            if (value.mainDirName==mainDirName)
            {
                resultSet.append(value) 
            }
        }
        return resultSet
    }
    
}
