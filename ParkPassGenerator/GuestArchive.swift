//
//  GuestArchive.swift
//  ParkPassGenerator
//
//  Created by Harold Davis on 10/1/16.
//  Copyright © 2016 Zendoart. All rights reserved.
//

import Foundation

var tempClassType: ClassificationType = .default1

var EmployeeArchive: [Employee] = [blank]

var GuestArchive: [ClassicGuest] = [blank2]

var ManagerArchive: [Manager] = [blank3]

var VenderEmployeeArchive: [Vendor] = [blank4]




var blank = Employee(fName: "harold", lName: "davis", classification: .foodServices, note: "")
var blank2 = ClassicGuest(fName: "", lName: "", classification: .adult, note: "")
var blank3 = Manager(fName: "", lName: "", note: "")

var blank4 = Vendor(fName: "", lName: "", classification: .disney, note: "")
var blank5 = Manager(fName: "", lName: "", note: "")


//Employee Class Conversion Method
func employeeConversion(fName: String, lName: String, classType: ClassificationType) {
    if classType == .employee {
            tempClassType = .employee
        
    }



}





