//
//  TypeStructure.swift
//  ParkPassGenerator
//
//  Created by Harold Davis Jr on 10/1/16.
//  Copyright © 2016 Zendoart. All rights reserved.
//

import Foundation


protocol Foundation {
    var fName: String {get set}
    var lName: String {get set}
    var classType: ClassificationType {get set}
    var notes: String {get set}
    
    var discounts: DiscountType {get set}
    var access1: Access {get set}
    var access2: Access {get set}
    var access3: Access {get set}
    
}


class Manager: Foundation {
    //basic info
    var fName: String = ""
    var lName: String = ""
    var notes: String = ""
    //Misc
    var discounts: DiscountType = .Manager
    var access1: Access = .ControlRoom
    var access2: Access = .Kitchen
    var access3: Access = .OfficeRoom
    
    //Needs to be initialized ----
    init(fName: String, lName: String, note: String) {
        self.fName = fName
        self.lName = lName
        self.notes = note
    }
    var classType: ClassificationType = .manager
}

class ClassicGuest: Foundation {
//basic info
    var fName: String = ""
    var lName: String = ""
    var notes: String
    var classification: ButtonType
//Misc
        var discounts: DiscountType = .Guest
    //Needs to be initialized ----
        var access1: Access = .none
        var access2: Access = .none
        var access3: Access = .none
    
    init(fName: String, lName: String, classification: ButtonType, note: String) {
        self.fName = fName
        self.lName = lName
        self.notes = note
        self.classification = classification
    }
    var classType: ClassificationType = .guest

    func classificationswitcher() {
        if classification == .child {
            classType = .child
        } else if classification == .adult {
            classType = .adult
        } else if classification == .senior {
            classType = .senior
        } else if classification == .vip {
            classType = .vip
        }
    }
}

class VIP: Foundation {
    //basic info
    var fName: String = ""
    var lName: String = ""
    var notes: String = ""
    var classType: ClassificationType = .vip
    
    //Misc

    var discounts: DiscountType = .VIP
    var access1: Access = .none
    var access2: Access = .none
    var access3: Access = .none
    
    
    //Needs to be initialized ----
    init(fName: String, lName: String, note: String) {
        self.fName = fName
        self.lName = lName
        self.notes = note
    }
}

class Vendor: Foundation {
    var fName: String = ""
    var lName: String = ""
    var notes: String = ""
    var classification: ButtonType
    
    var CompanyName: Company = .none
    
    //The Misc Items for the Vendor Status
    var discounts: DiscountType = .Vender
    var access1: Access = .Kitchen
    var access2: Access = .OfficeRoom
    var access3: Access = .none
    
    init(fName: String, lName: String, classification: ButtonType, note: String) {
        self.fName = fName
        self.lName = lName
        self.notes = note
        self.classification = classification
    }
    var classType: ClassificationType = .vender


}



class Child: Foundation {
    var fName: String = ""
    var lName: String = ""
    var notes: String = ""
    
    var discounts: DiscountType = .Guest
    var access1: Access = .none
    var access2: Access = .none
    var access3: Access = .none
    
    init(fName: String, lName: String, note: String) {
        self.fName = fName
        self.lName = lName
        self.notes = note
    }
    
    var classType: ClassificationType = .child
    


}


class Employee: Foundation {
    var fName: String = ""
    var lName: String = ""
    var notes: String = ""
    
    var classification: ButtonType
    var classType: ClassificationType = .employee
    
    var discounts: DiscountType = .Employee
    var access1: Access = .OfficeRoom
    var access2: Access = .ControlRoom
    var access3: Access = .none
    
    init(fName: String, lName: String, classification: ButtonType, note: String) {
        //Basic Info
        self.fName = fName
        self.lName = lName
        self.notes = note
        self.classification = classification
    }
    func classificationswitcher() {
        if classification == .foodServices
        {
            classType = .foodServices
        } else if classification == .rideServices {
            classType = .rideServices
        } else if classification == .contract {
            classType = .contract
        } else if classification == .maintenance {
            classType = .maintenance
        }
    }
}

class Adult: Foundation {
    var fName: String = ""
    var lName: String = ""
    var notes: String = ""
    var classType: ClassificationType = .adult
    
    var discounts: DiscountType = .Guest
    var access1: Access = .none
    var access2: Access = .none
    var access3: Access = .none
    
    
    init(fName: String, lName: String, note: String) {
        self.fName = fName
        self.lName = lName
        self.notes = note
    }


}





//Discounts for Food and Merch
enum DiscountType {
    case Guest
    case VIP
    case Manager
    case Vender
    case Employee
    case none
}
//Access to different parts of the park
enum Access {
    case Kitchen
    case ControlRoom
    case OfficeRoom
    case none
    
    var rawValue: String {
        switch self {
        case .Kitchen:
            return "Kitchen"
        case .ControlRoom:
            return "Central Room"
        case .OfficeRoom:
            return "Office Room"
        default:
            return "No Access"
        }
    }
}
extension Access {
    var labelName: String {
        return String(self.rawValue)
    }
}
enum ClassificationType {
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

enum Company {
    case apple
    case disney
    case mcDonalds
    case funnalCakes
    case none
}

enum ButtonType {
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

