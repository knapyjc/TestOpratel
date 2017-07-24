//
//  IssueDetailViewController.swift
//  TestIssues
//
//  Created by Juan Carlos Cardozo on 23/7/17.
//  Copyright © 2017 Juan Carlos Cardozo. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController {
    
    //MARK: - Labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var sujectLabel: UILabel!
    @IBOutlet weak var descriptioLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var stimatedLabel: UILabel!
    @IBOutlet weak var spendLabel: UILabel!
    @IBOutlet weak var stimatedTimeLabel: UILabel!
    @IBOutlet weak var spendTimeLabel: UILabel!
    
    //MARK: - Views
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var stimatedView: UIView!
    @IBOutlet weak var spendView: UIView!
    
    //MARK: Data
    var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style
        var titleAttributes = [String : Any]()
        titleAttributes[NSForegroundColorAttributeName] = Color.greyColor
        titleAttributes[NSFontAttributeName] = UIFont(name: "OpenSans-CondensedBold", size: 14)!
        
        var textAttributes = [String : Any]()
        textAttributes[NSForegroundColorAttributeName] = Color.greyColor
        textAttributes[NSFontAttributeName] = UIFont(name: "OpenSans-CondensedLight", size: 14)!
        
        var titlePriorityAttributes = [String : Any]()
        titlePriorityAttributes[NSForegroundColorAttributeName] = UIColor.white
        titlePriorityAttributes[NSFontAttributeName] = UIFont(name: "OpenSans-CondensedLight", size: 18)!
        
        var textPriorityAttributes = [String : Any]()
        textPriorityAttributes[NSForegroundColorAttributeName] = UIColor.white
        textPriorityAttributes[NSFontAttributeName] = UIFont(name: "OpenSans-CondensedBold", size: 18)!
        
        titleLabel.titleWhiteLight()
        titleView.backgroundColor = Color.greyColor
        lineView.backgroundColor = Color.greyColor
        dateView.backgroundColor = Color.greyColor
        priorityView.backgroundColor = Color.yellowColor
        stimatedView.backgroundColor = Color.blueColor
        spendView.backgroundColor = Color.greenColor
        
        monthLabel.titleWhiteLight()
        dayLabel.titleWhiteBold()
        sujectLabel.textGreyLight()
        descriptioLabel.textGreyLight()
        authorLabel.titleGreyBold()
        stimatedLabel.titleGreyBold()
        spendLabel.titleGreyBold()
        stimatedTimeLabel.timeWhiteBold()
        spendTimeLabel.timeWhiteBold()
        
        dateView.layer.cornerRadius = 30.0
        stimatedView.layer.cornerRadius = 62.5
        spendView.layer.cornerRadius = 62.5
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: (issue?.start_date)!)
        print(date ?? "")
        
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date!)
        let month = components.month
        let day = components.day
        
        //Date
        self.dayLabel.text = String(day!)
        let stringMonth = MyHelpers.getMonth(intMonth: month!)
        self.monthLabel.text = stringMonth
        
        //Author
        let authorString = issue?.author.popLast()?.name
        let authorUppercase = authorString?.uppercased()
        self.authorLabel.text = authorUppercase
        
        //Suject and Description
        let cellSuject = issue?.subject
        let cellDescription = issue?.description
        
        let sujectTitleString = NSAttributedString(string: "Suject: ", attributes: titleAttributes)
        let sujectTextString = NSAttributedString(string: cellSuject!, attributes: textAttributes)
        let concatSujectString = NSMutableAttributedString(attributedString: sujectTitleString)
        concatSujectString.append(sujectTextString)
        
        let descriptionTitleString = NSAttributedString(string: "Description: ", attributes: titleAttributes)
        let descriptionTextString = NSAttributedString(string: cellDescription!, attributes: textAttributes)
        let concatDescriptionString = NSMutableAttributedString(attributedString: descriptionTitleString)
        concatDescriptionString.append(descriptionTextString)
        
        self.sujectLabel.attributedText = concatSujectString
        self.descriptioLabel.attributedText = concatDescriptionString
        
        //Priority
        let priorityTitleString = NSAttributedString(string: "PRIORITY: ", attributes: titlePriorityAttributes)
        
        let priorityString = issue?.priority.popLast()?.name
        let priorityUppercase = priorityString?.uppercased()
        
        let priorityTextString = NSAttributedString(string: priorityUppercase!, attributes: textPriorityAttributes)
        
        let concatPriorityString = NSMutableAttributedString(attributedString: priorityTitleString)
        concatPriorityString.append(priorityTextString)

        self.priorityLabel.attributedText = concatPriorityString
        
        self.stimatedTimeLabel.text = issue?.estimated_hours
        self.spendTimeLabel.text = issue?.done_ratio ?? "0"
        
    }
}

