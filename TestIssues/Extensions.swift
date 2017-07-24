//
//  Extensions.swift
//  TestIssues
//
//  Created by Juan Carlos Cardozo on 22/7/17.
//  Copyright © 2017 Juan Carlos Cardozo. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func customNavBar() {
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = Color.greenColor
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "OpenSans-CondensedBold", size: 16.0)!]
        self.navigationBar.titleTextAttributes = [NSStrokeColorAttributeName: UIColor.white]
    }
    
}

extension UIView{
    
    func displayIndicator(indicator:UIActivityIndicatorView, container:UIView, loadingView: UIView){
        //MARK: - Conteiner View
        container.frame = self.frame
        container.center = self.center
        container.backgroundColor = UIColor(red:0.69, green:0.68, blue:0.67, alpha:1.0).withAlphaComponent(0.4)
        
        //MARK: - Loading View
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        loadingView.center = self.center
        loadingView.backgroundColor = UIColor.clear
        
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 15
        
        //MARK: - Activity Indicator
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        indicator.color = Color.greenColor
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0)
        indicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        //MARK: - Show Indicator
        loadingView.addSubview(indicator)
        container.addSubview(loadingView)
        self.addSubview(container)
        container.isHidden = false
        indicator.startAnimating()
    }
    
    func stopIndicator(indicator:UIActivityIndicatorView, container:UIView){
        indicator.stopAnimating()
        indicator.hidesWhenStopped = true
        container.isHidden = true
    }
    
}

extension UILabel{
    
    func titleGreyBold(){
        
        var fontSize = 0
        if MyHelpers.isLessThanIPhone6(){
            fontSize = 14
        }
        else if MyHelpers.isPlus(){
            fontSize = 16
        }
        else{
            fontSize = 15
        }
        
        let OpenSansFont : UIFont = UIFont(name: "OpenSans-CondensedBold", size: CGFloat(fontSize))!
        self.font = OpenSansFont
        self.textColor = Color.greyColor
        
    }
    
    func textGreyLight(){
        
        var fontSize = 0
        if MyHelpers.isLessThanIPhone6(){
            fontSize = 12
        }
        else if MyHelpers.isPlus(){
            fontSize = 14
        }
        else{
            fontSize = 13
        }
        
        let OpenSansFont : UIFont = UIFont(name: "OpenSans-CondensedLight", size: CGFloat(fontSize))!
        self.font = OpenSansFont
        self.textColor = Color.greyColor
        
    }
    
    func titleWhiteBold(){
        
        var fontSize = 0
        if MyHelpers.isLessThanIPhone6(){
            fontSize = 14
        }
        else if MyHelpers.isPlus(){
            fontSize = 16
        }
        else{
            fontSize = 15
        }
        
        let OpenSansFont : UIFont = UIFont(name: "OpenSans-CondensedBold", size: CGFloat(fontSize))!
        self.font = OpenSansFont
        self.textColor = UIColor.white
        
    }
    
    func titleWhiteLight(){
        
        var fontSize = 0
        if MyHelpers.isLessThanIPhone6(){
            fontSize = 14
        }
        else if MyHelpers.isPlus(){
            fontSize = 16
        }
        else{
            fontSize = 15
        }
        
        let OpenSansFont : UIFont = UIFont(name: "OpenSans-CondensedLight", size: CGFloat(fontSize))!
        self.font = OpenSansFont
        self.textColor = UIColor.white
        
    }
    
    func timeWhiteBold(){
        
        var fontSize = 0
        if MyHelpers.isLessThanIPhone6(){
            fontSize = 18
        }
        else if MyHelpers.isPlus(){
            fontSize = 20
        }
        else{
            fontSize = 19
        }
        
        let OpenSansFont : UIFont = UIFont(name: "OpenSans-CondensedBold", size: CGFloat(fontSize))!
        self.font = OpenSansFont
        self.textColor = UIColor.white
        
    }
}

