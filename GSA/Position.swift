//
//  Position.swift
//  GSA
//
//  Created by Andrew Capindo on 11/9/15.
//  Copyright © 2015 Zach Goodman. All rights reserved.
//

import Foundation

class Position {
    private var _title:String
    private var _level:Float
    
    var title: String {
        get {
            return _title
        }
        set (newTitle){
            _title = title
        }
    }
    
    var level: Float {
        get {
            return _level
        }
        set (newLevel){
            _level = newLevel
        }
    }
    
    // Constructor for Position Object
    init(title: String, level: Float) {
        _title = title
        _level = level
    }
}