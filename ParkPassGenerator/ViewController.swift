//
//  ViewController.swift
//  ParkPassGenerator
//
//  Created by Harold Davis Jr on 10/1/16.
//  Copyright © 2016 Zendoart. All rights reserved.
//

import UIKit
import Foundation
import GameKit

enum Buttons {
    case guest
    case employee
    case manager
    case vender
    //subOption
    case child
    case adult
    case senior
    case vip
    case default1
    //employeeOptions
    case foodServices
    case rideServices
    case maintenance // Maintanence Employee
    case contract //Temperery Employment
    //Vender
    case apple
    case disney
    case mcDonalds
    case funnalCakes
    
}

var accessOne: Access = .none
var accessTwo: Access = .none
var accessThree: Access = .none
var discounts: DiscountType = .none
//----------------------------------------------------


var Pass = ["First": "", "Last": "", "Class":"", "Passes": "", "Access":"", "Discount1":"", "Discount2":"", "Notes": ""]

func passTypeGenerator(type: String) -> Buttons {
    
    switch type {
    case "Guest":
        return .guest
    case "Employees":
        return .employee
    case "Managers":
        return .manager
    case "Venders":
        return .vender
    default:
        return .default1
    }
    
    
}

var MainMenu: Buttons = .default1
var SubMenu: Buttons = .default1

class ViewController: UIViewController {

    
    //UI Main Buttons selection
    @IBOutlet weak var GuestOptionsButton: UIButton!
    @IBOutlet weak var EmployeeButton: UIButton!
    @IBOutlet weak var ManagerButton: UIButton!
    @IBOutlet weak var VendorButton: UIButton!
    //Sub Menu Buttons
    @IBOutlet weak var SubButtonOne: UIButton!
    @IBOutlet weak var SubButtonTwo: UIButton!
    @IBOutlet weak var SubMenuThree: UIButton!
    @IBOutlet weak var SubMenuFour: UIButton!
   //Function Buttons
    @IBAction func GeneratePass(_ sender: AnyObject) {
        tempProfileMethod(classType: MainMenu)

        passGeneratorMethod(MainMenu, subMenuSelection: SubMenu)
        
        //self.performSegue(withIdentifier: "segue", sender: CreateNewPassViewController())
        

    }
    
    @IBAction func PopulateData(_ sender: AnyObject) {
        if MainMenu == .guest {
            randomGuestSelection()
        } else if MainMenu == .employee {
            randomEmployeeSelection()
        } else if MainMenu == .manager {
            randomManagerSelection()
        } else if MainMenu == .vender {
        
        }
    }
    //Data Input
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var addittionalNotes: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonControlMethod()

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    ///////////////
    ///Converter///
    ///////////////
    func ButtonPressResponder(mainButton: UIButton, subButton: UIButton) {
        
        if mainButton == GuestOptionsButton && subButton == SubButtonOne {
            //classType == ***
        }
    
    }
    
    func buttonControlMethod() {
        let button1 = SubButtonOne
        let button2 = SubButtonTwo
        let button3 = SubMenuThree
        let button4 = SubMenuFour
        let MainButton1 = GuestOptionsButton
        let MainButton2 = EmployeeButton
        let MainButton3 = ManagerButton
        let MainButton4 = VendorButton
        
        //Button connections: connects the buttons to a method controller
        button1?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        button2?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        button3?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        button4?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        //Main Menu Button Connections
        MainButton1?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        MainButton2?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        MainButton3?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)
        MainButton4?.addTarget(self, action: #selector(MainButtonPressMethod(_:)), for: .touchUpInside)

    }
    //Adjusts the subMenu Buttons to be "nil" when the manager button is press
    func setNilTitleForManager() {
        MainMenu = .manager
        SubButtonOne.setTitle("", for: UIControlState())
        SubButtonTwo.setTitle("", for: UIControlState())
        SubMenuThree.setTitle("", for: UIControlState())
        SubMenuFour.setTitle("", for: UIControlState())
    }


    func MainButtonPressMethod(_ sender: UIButton!) {
        if sender == GuestOptionsButton {
            MainMenu = .guest //Set Main Menue selection to the GuestType
            setTitlesForGuest()
            dimedTextLightingMethod("MainOne", sender: sender)
        } else if sender == EmployeeButton {
            dimedTextLightingMethod("MainTwo",sender: sender)
            setTitleForEmployee()
            MainMenu = .employee // set MainMenu
        } else if sender == ManagerButton {
            dimedTextLightingMethod("MainThree", sender: sender)
            setNilTitleForManager()
            MainMenu = .manager
        } else if sender == VendorButton {
            dimedTextLightingMethod("", sender: sender)
            setTitlesForVenders()
            MainMenu = .vender
        }
        if sender == SubButtonOne {
            RefrenceSubButtonsMethod(sender)
            dimedTextLightingMethod("optionOne", sender: sender)
        } else if sender == SubButtonTwo {
            dimedTextLightingMethod("optionTwo", sender: sender)
            
        } else if sender == SubMenuThree {
            dimedTextLightingMethod("optionThree", sender: sender)
            print("touched 3")
        } else if sender == SubMenuFour {
            dimedTextLightingMethod("optionFour", sender: sender)
            print("touched 4")
        }
        
    }
    
    
    ////////////////////
    //Sub Title Change//
    ////////////////////
    //--------------------------------------------------------------
    //Guest Types
    func setTitlesForGuest() {
        MainMenu = .guest
        SubButtonOne.setTitle("Child", for: UIControlState())
        SubButtonTwo.setTitle("Adult", for: UIControlState())
        SubMenuThree.setTitle("Senior", for: UIControlState())
        SubMenuFour.setTitle("Vip", for: UIControlState())
    }
        //Employee Types
    func setTitleForEmployee() {
        MainMenu = .employee
        SubButtonOne.setTitle("Food Servises", for: UIControlState())
        SubButtonTwo.setTitle("Ride Services", for: UIControlState())
        SubMenuThree.setTitle("Maintenence", for: UIControlState())
        SubMenuFour.setTitle("Contract", for: UIControlState())
    }
    //Private Venders Types
    func setTitlesForVenders() {
        MainMenu = .vender
        SubButtonOne.setTitle("Apple", for: UIControlState())
        SubButtonTwo.setTitle("McDonalds", for: UIControlState())
        SubMenuThree.setTitle("Funnel Cakes", for: UIControlState())
        SubMenuFour.setTitle("Disney Land", for: UIControlState())
    }
    //--------------------------------------------------------------
    
    func GuestPassButton() {
        setTitlesForGuest()
        
    }
    
    //Dim the text of the other Options putting emphasis on what the user selected...
    func dimedTextLightingMethod(_ selection: String, sender: UIButton) {
        // Main Menu Button Dimming
        func MainOneDim() {
            GuestOptionsButton.setTitleColor(UIColor.white, for: UIControlState())
            EmployeeButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            ManagerButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            VendorButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        func MainTwoDim() {
            GuestOptionsButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            EmployeeButton.setTitleColor(UIColor.white, for: UIControlState())
            ManagerButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            VendorButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        func MainThreeDim() {
            GuestOptionsButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            EmployeeButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            ManagerButton.setTitleColor(UIColor.white, for: UIControlState())
            VendorButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        func MainFourDim() {
            GuestOptionsButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            EmployeeButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            ManagerButton.setTitleColor(UIColor.darkGray, for: UIControlState())
            VendorButton.setTitleColor(UIColor.white, for: UIControlState())
        }

        // Sub Menu Button Dimming
        func optionOneDim() {
            //subMenu Button identifier
            if MainMenu == .guest {
                if sender == SubButtonOne {
                    SubMenu = .child
                    print("Yay you touch button child!")
                }
            }
            if MainMenu == .employee {
                if sender == SubButtonOne {
                    SubMenu = .foodServices
                    print("Yay you touch button FoodServices!")
                    
                }
            }
            if MainMenu == .vender {
                if sender == SubButtonOne {
                    SubMenu = .apple
                    print("Yay you touch button Apple!")
                    
                }
            }
            //Dim Qualities
            SubButtonOne.setTitleColor(UIColor.white, for: UIControlState())
            SubButtonTwo.setTitleColor(UIColor.darkGray, for: UIControlState())
            SubMenuThree.setTitleColor(UIColor.darkGray, for: UIControlState())
            SubMenuFour.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        func optionTwoDim() {
            //subMenu Button identifier
            
            if MainMenu == .guest {
                if sender == SubButtonTwo {
                    SubMenu = .adult
                    print("Yay you touch button Adult!")
                }
            }
            if MainMenu == .employee {
                if sender == SubButtonTwo {
                    SubMenu = .rideServices
                    print("Yay you touch button RideServices!")
                }
            }
            if MainMenu == .vender {
                if sender == SubButtonTwo {
                    SubMenu = .mcDonalds
                    print("Yay you touch button McDonalds!")
                    
                }
            }
            //Dim Qualities
            SubButtonOne.setTitleColor(UIColor.darkGray, for: UIControlState())
            SubButtonTwo.setTitleColor(UIColor.white, for: UIControlState())
            SubMenuThree.setTitleColor(UIColor.darkGray, for: UIControlState())
            SubMenuFour.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        func optionThreeDim() {
            //subMenu Button identifier
            if MainMenu == .guest {
                if sender == SubMenuThree {
                    SubMenu = .senior
                    print("Yay you touch button Senior!")
                }
            }
            if MainMenu == .employee {
                if sender == SubMenuThree {
                    SubMenu = .maintenance
                    print("Yay you touch button Maintenance!")
                }
            }
            if MainMenu == .vender {
                if sender == SubMenuThree {
                    SubMenu = .funnalCakes
                    print("Yay you touch button FunnalCakes!")
                }
            }
            //Dim Qualities
            SubButtonOne.setTitleColor(UIColor.darkGray, for: UIControlState())
            SubButtonTwo.setTitleColor(UIColor.darkGray, for: UIControlState())
            SubMenuThree.setTitleColor(UIColor.white, for: UIControlState())
            SubMenuFour.setTitleColor(UIColor.darkGray, for: UIControlState())
        }
        
    func optionFourDim() {
        //subMenu Button identifier
        if MainMenu == .guest {
            if sender == SubMenuFour {
                SubMenu = .vip
                print("Yay you touch button Vip!")
            }
        }
        if MainMenu == .employee {
            if sender == SubMenuFour {
                SubMenu = .contract
                print("Yay you touch button Contract!")
            }
        }
        if MainMenu == .vender {
            if sender == SubMenuFour {
                SubMenu = .disney
                print("Yay you touch button Disney!")
            }
        }
        //Dim Qualities
        SubButtonOne.setTitleColor(UIColor.darkGray, for: UIControlState())
        SubButtonTwo.setTitleColor(UIColor.darkGray, for: UIControlState())
        SubMenuThree.setTitleColor(UIColor.darkGray, for: UIControlState())
        SubMenuFour.setTitleColor(UIColor.white, for: UIControlState())
    }
    // selections on how to dim the labels of buttons not pressed
    switch selection {
    case "optionOne":
    return optionOneDim()
    case "optionTwo":
    return optionTwoDim()
    case "optionThree":
    return optionThreeDim()
    case "optionFour":
    return optionFourDim()
    case "MainOne":
    return MainOneDim()
    case "MainTwo":
    return MainTwoDim()
    case "MainThree":
    return MainThreeDim()
    default :
    return MainFourDim()
    
    }
}

    func RefrenceSubButtonsMethod(_ input: UIButton!) {
        //keeping track of button pressed
        if MainMenu == .guest {
            if input == SubButtonOne {
                SubMenu = .child
                print("Yay you touch button child!")
            } else if input == SubButtonTwo {
                SubMenu = .adult
                print("Yay you touch button two!")
            } else if input == SubMenuThree {
                SubMenu = .senior
                print("Yay you touch button three!")
            } else if input == SubMenuFour {
                SubMenu = .vip
            }
            
        } else if MainMenu == .employee {
            if input == SubButtonOne {
                SubMenu = .foodServices
                print("Touched Food services")
            } else if input == SubButtonTwo{
                SubMenu = .rideServices
                print("Touched Ride Services")
            } else if input == SubMenuThree {
                SubMenu = .maintenance
                print("Touched Maintenece")
            } else if input == SubMenuFour {
                SubMenu = .contract
                print("Touched Contract")
            }
        } else if MainMenu == .manager {
            if input == SubButtonOne {
                
            }
            else if input == SubButtonTwo {
                
            }
            else if input == SubMenuThree {
                
            }
            else if input == SubMenuFour {
                
            }
            
        } else if MainMenu == .vender {
            if input == SubButtonOne {
                SubMenu = .apple
            } else if input == SubButtonTwo {
                SubMenu = .mcDonalds
            } else if input == SubMenuThree {
                SubMenu = .funnalCakes
            } else if input == SubMenuFour {
                SubMenu = .disney
            }
            
        }
        
    }
    
    
    ///////////////////////////
    ///Pass Generator Method///
    ///////////////////////////
    func passGeneratorMethod(_ mainMenuSelection: Buttons, subMenuSelection: Buttons) {
        Pass.removeAll()
        
        let inputFName = firstName.text
        let inputLName = lastName.text
        var classification: String = "none"
        let access1 = "none"
        let note = addittionalNotes.text
        
        //        var discount1: String = "none"
        //        var discount2: String = "none"
        //
        
        // If statements to find key classification
        if mainMenuSelection == .guest && subMenuSelection == .child {
            classification = "Child Pass"
        } else if mainMenuSelection == .guest && subMenuSelection == .adult {
            classification = "Adult Pass"
        } else if mainMenuSelection == .guest && subMenuSelection == .senior {
            classification = "Senior Pass"
        } else if mainMenuSelection == .guest && subMenuSelection == .vip {
            classification = "Vip Pass"
        }
        
        if mainMenuSelection == .employee && subMenuSelection == .foodServices {
            classification = "Food Services"
        } else if mainMenuSelection == .employee && subMenuSelection == .rideServices {
            classification = "Ride Services"
        } else if mainMenuSelection == .employee && subMenuSelection == .maintenance {
            classification = "Maintenance"
        } else if mainMenuSelection == .employee && subMenuSelection == .contract {
            classification = "Contract"
        } else if mainMenuSelection == .manager {
            classification = "Manager"
        }
        
        //Collect the data for the Pass Generator Page
        Pass["First"] = inputFName
        Pass["Last"] = inputLName
        Pass["Class"] = classification
        //***
        Pass["Access"] = access1
        Pass["Notes"] = note

    }

    
    enum error: Error {
        
        case noSubSelection // No Sub category selection made * do a pop up notification
        case noInput // No text input from the user.
        case invalidSelections //Sub dMenu does not match
        case requiedFieldEmpty //Based on the sub category the category selected the required field was not filled out
        
    }
    
    //--------------
    
    //Function to grab a random label
    func BigLabelTextElements(_ randomPerson: Employee) {
        
        let FirstNameNew = randomPerson.fName
        let LastNameNew = randomPerson.lName
        
        firstName.text = FirstNameNew
        lastName.text = LastNameNew
        
    }
    //--------------
    func randomGuestSelection() {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: GuestArchive.count)
        let randomPerson = GuestArchive[randomNumber]
    
        let fName = randomPerson.fName
        let lName = randomPerson.lName
        
        firstName.text = fName
        lastName.text = lName
        
    }
    
    func randomEmployeeSelection() {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: GuestArchive.count)
        let randomPerson = EmployeeArchive[randomNumber]
    
        let fName = randomPerson.fName
        let lName = randomPerson.lName
        
        firstName.text = fName
        lastName.text = lName
    
    }
    func randomManagerSelection() {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: ManagerArchive.count)
        let randomPerson = ManagerArchive[randomNumber]
        
        let fName = randomPerson.fName
        let lName = randomPerson.lName
        
        firstName.text = fName
        lastName.text = lName
    
    }
    func randomSelectionVendor() {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: VenderEmployeeArchive.count)
        let randomPerson = VenderEmployeeArchive[randomNumber]
        
        let fName = randomPerson.fName
        let lName = randomPerson.lName
        
        firstName.text = fName
        lastName.text = lName
    
    }
    
    
    
    //How we get a random Guest to populate
    //--------------
    
    func AreaAccess(inputType: String) -> Bool {
        var Access: Bool
        if inputType == "Access" {
            Access = true
        } else {
            Access = false
        }
        return Access
    }
    
    func tempProfileMethod(classType: Buttons){

        if classType == .guest {
            let tempProfile = ClassicGuest(fName: "", lName: "", classification: .guest, note: "")
            accessOne = tempProfile.access1
            accessTwo = tempProfile.access2
            accessThree = tempProfile.access3
        } else if classType == .employee {
            let tempProfile = Employee(fName: "", lName: "", classification: .employee, note: "")
            accessOne = tempProfile.access1
            accessTwo = tempProfile.access2
            accessThree = tempProfile.access3
        } else if classType == .manager {
            let tempProfile = Manager(fName: "", lName: "", note: "")
            accessOne = tempProfile.access1
            accessTwo = tempProfile.access2
            accessThree = tempProfile.access3
        } else if classType == .vender {
            let tempProfile = Vendor(fName: "", lName: "", classification: .vender, note: "")
            accessOne = tempProfile.access1
            accessTwo = tempProfile.access2
            accessThree = tempProfile.access3
        }
        
    }
    



}

