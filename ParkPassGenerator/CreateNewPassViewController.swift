//
//  CreateNewPassViewController.swift
//  ParkPassGenerator
//
//  Created by Harold Davis on 10/5/16.
//  Copyright © 2016 Zendoart. All rights reserved.
//

import UIKit

class CreateNewPassViewController: UIViewController {
    
    let passInfo = Pass
    
// labels
    @IBOutlet weak var firstAndLastName: UILabel!
    
    @IBOutlet weak var classificationType: UILabel!
    
    @IBOutlet weak var DiscountOne: UILabel!
    
    @IBOutlet weak var DiscountTwo: UILabel!
    
    @IBOutlet weak var rideAccess: UILabel!
    
    @IBOutlet weak var captureNotes: UILabel!
//Buttons

    @IBAction func StoreProfile(_ sender: AnyObject) {

        let fName = passInfo["First"]
        let lName = passInfo["Last"]
        let classification = passInfo["Class"]
        let notes = passInfo["Notes"]
        
        TerminalCommunicationOneGuest(fName!, lastName: lName!,classType: classification!, notes: notes!)
        
    }
    //Access Test Results
    @IBAction func AreaAccess(_ sender: AnyObject) {
        TestResult.text = accessAreaTesting(accessNumberOne: accessOne, accessNumberTwo: accessTwo)
    }
    
    @IBAction func RideAccess(_ sender: AnyObject) {
        TestResult.text = accessToRides(mainType: MainMenu)
    }
    
    @IBAction func DiscountTesting(_ sender: AnyObject) {
        
    }
    
    
//Test Result
    @IBOutlet weak var TestResult: UILabel!
    
    
    
    
    //Segue Animation when appearing
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passRetrieverInformation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func passRetrieverInformation() {
        let fName = passInfo["First"]
        let lName = passInfo["Last"]
        let classification = passInfo["Class"]
        let notes = passInfo["Notes"]
        firstAndLastName.text = "\(fName!) \(lName!)"
        
        classificationType.text = "\(classification!)"
        captureNotes.text = "\(notes)"
        
    }

    //--------------
    
    ////////////////////////////
    ///Terminal Communication///
    ////////////////////////////
    func TerminalCommunicationOneGuest(_ firstName: String, lastName: String, classType: String, notes: String) {
        
        if classType == "Child Pass" {
            let temp = ClassicGuest(fName: firstName, lName: lastName, classification: .child, note: notes)
            GuestArchive.append(temp)
        } else if classType == "Adult Pass" {
            let temp = ClassicGuest(fName: firstName, lName: lastName, classification: .adult, note: notes)
            GuestArchive.append(temp)
        } else if classType == "Senior Pass" {
            let temp = ClassicGuest(fName: firstName, lName: lastName, classification: .senior, note: notes)
            GuestArchive.append(temp)
        } else if classType == "Vip Pass" {
            let temp = ClassicGuest(fName: firstName, lName: lastName, classification: .vip, note: notes)
            GuestArchive.append(temp)
        } else if classType == "Food Servises" {
            let temp = Employee(fName: firstName, lName: lastName, classification: .foodServices, note: notes)
                EmployeeArchive.append(temp)
        } else if classType == "Ride Services" {
            let temp = Employee(fName: firstName, lName: lastName, classification: .rideServices, note: notes)
                EmployeeArchive.append(temp)
        } else if classType == "Maintenence" {
            let temp = Employee(fName: firstName, lName: lastName, classification: .maintenance, note: notes)
                EmployeeArchive.append(temp)
        } else if classType == "Contract" {
            let temp = Employee(fName: firstName, lName: lastName, classification: .contract, note: notes)
                EmployeeArchive.append(temp)
        } else if classType == "Apple" {
            let temp = Vendor(fName: firstName, lName: lastName, classification: .apple, note: notes)
            VenderEmployeeArchive.append(temp)
        } else if classType == "Funnel Cakes" {
            let temp = Vendor(fName: firstName, lName: lastName, classification: .funnalCakes,note: notes)
            VenderEmployeeArchive.append(temp)
        } else if classType == "McDonalds" {
            let temp = Vendor(fName: firstName, lName: lastName, classification: .mcDonalds, note: notes)
            VenderEmployeeArchive.append(temp)
        } else if classType == "Disney Land" {
            let temp = Vendor(fName: firstName, lName: lastName, classification: .disney, note: notes)
            VenderEmployeeArchive.append(temp)
        }
    
        
    }
    
    
    //--------------
    func accessToRides(mainType: Buttons)-> String {
        
        var testResults: String = ""
        
        if mainType == .contract {
             testResults = "This Pass has access to no rides."
            TestResult.textColor = UIColor.red
        
        } else if mainType == .guest && SubMenu == .vip  {
              testResults = "This Pass has access to unlimited rides."
            TestResult.textColor = UIColor.green
        }else {
             testResults = "This Pass has access to all rides!"
        }
        return testResults
        
    }
    
    func accessAreaTesting(accessNumberOne: Access, accessNumberTwo: Access)-> String {
        if accessNumberOne == .none && accessNumberTwo == .none {
        TestResult.textColor = UIColor.red
        } else {
         TestResult.textColor = UIColor.green
        }
        //Set results filtered
        let testResults: String = "This Pass has access to: \n \(accessNumberOne.rawValue) \n \(accessNumberTwo.rawValue)"
        
    return testResults
        
    }
    

}
