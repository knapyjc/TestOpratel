//
//  MyTableViewCell.swift
//  TestIssues
//
//  Created by Juan Carlos Cardozo on 22/7/17.
//  Copyright © 2017 Juan Carlos Cardozo. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var footerLine: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var sujectLabel: UILabel!
    @IBOutlet weak var descriptioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lineView.backgroundColor = Color.greyColor
        dateView.backgroundColor = Color.greyColor
        footerLine.backgroundColor = Color.greyColor
        monthLabel.titleWhiteLight()
        dayLabel.titleWhiteBold()
        sujectLabel.textGreyLight()
        descriptioLabel.textGreyLight()
        
        dateView.layer.cornerRadius = 30.0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
