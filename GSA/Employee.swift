//
//  Employee.swift
//  GSA
//
//  Created by Zach Goodman on 10/9/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import Foundation

// --------
// Employee
// --------

class Employee : CopyProtocol, Equatable, CustomStringConvertible {
    
    // ------------
    // data members
    // ------------
    
    var firstName: String = ""
    var lastName: String = ""
    var position: [String] = []
    var index: Int!
    
    private var _null: Bool = false
    
    var shifts: Week = Week()
    
    var description: String {
        get {
            return fullName
        }
    }
    
    var isNullEmployee: Bool {
        get {
            return self._null
        }
    }
    
    var shiftCount: Int {
        get {
            return shifts.shiftCount
        }
    }
    
    var fullName: String {
        get {
            if firstName != "" && lastName != "" {
                return firstName + " " + lastName
            }
            if firstName != "" {
                return firstName
            }
            return lastName
        }
    }
    
    // ------------
    // constructors
    // ------------
    
    init(firstName: String) {
        self.firstName = firstName
    }
    
    convenience init(null: Bool) {
        self.init(firstName: "Unassigned")
        self._null = null
    }
    
    convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName)
        self.lastName = lastName
    }
    
    convenience init(firstName: String, lastName: String, position: String) {
        self.init(firstName: firstName, lastName: lastName)
        self.position.append(position)
    }
    
    // required initializer for the Copying protocol
    required init(original: Employee) {
        firstName = original.firstName
        lastName = original.lastName
        position = original.position
    }
    
    // -------
    // methods
    // -------
    
    func indexOfShift(shift: Shift) -> Int {
        var i = 0
        for s in shifts {
            if shift == s {
                break
            }
            ++i
        }
        return i
    }
    
    func shiftNumberByDay(shift: Shift) -> Int {
        return shifts.shiftNumberByDay(shift)
    }
    
    func shiftNumberByWeek(shift: Shift) -> Int {
        return shifts.shiftNumberByWeek(shift)
    }
    
    func getShiftAtIndex(index: Int) -> Shift {
        return shifts[index]!
    }
    
    func append(shift: Shift) {
        shifts.append(shift)
    }
    
    func remove(shift: Shift) {
        shifts.remove(shift)
    }
    
}

func ==(lhs: Employee, rhs: Employee) -> Bool {
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}