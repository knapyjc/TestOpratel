//
//  MyHelpers.swift
//  TestIssues
//
//  Created by Juan Carlos Cardozo on 22/7/17.
//  Copyright © 2017 Juan Carlos Cardozo. All rights reserved.
//

import UIKit

class MyHelpers {
    
    static let sharedInstance:MyHelpers = MyHelpers()
    
    private init(){}
    
    static func isLessThanIPhone6() -> Bool{
        
        let model: String = UIDevice.current.modelName
        return (model == "iPod 5" || model == "iPhone 5" || model == "iPhone 5c" ||
            model == "iPhone 5s" || model == "iPhone SE")
        //|| model == "Simulator")
    }
    
    static func isPlus() -> Bool{
        
        let model: String = UIDevice.current.modelName
        return (model == "iPhone 6 Plus" || model == "iPhone 6s Plus" || model == "iPhone 7 Plus")
        //|| model == "Simulator")
    }
    
    static func getMonth(intMonth:Int) -> String{
        
        switch intMonth {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sep"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return ""
        }
    }
    
}
