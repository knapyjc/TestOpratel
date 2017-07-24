//
//  issue.swift
//  TestIssues
//
//  Created by Juan Carlos Cardozo on 22/7/17.
//  Copyright © 2017 Juan Carlos Cardozo. All rights reserved.
//

class Issue {
    
    // MARK: Properties
    var id:String
    var project:[iData]
    var tracker:[iData]
    var status:[iData]
    var priority:[iData]
    var author:[iData]
    var subject:String
    var description:String
    var start_date:String
    var estimated_hours:String
    var done_ratio:String
    var created_on:String
    var updated_on:String
    
    static let getIssues = "http://demo.redmine.org/issues.json"
    
    // MARK: Initialization
    init?(id:String, project:[iData], tracker:[iData], status:[iData], priority:[iData], author:[iData], subject:String, description:String, start_date:String, estimated_hours:String, done_ratio:String, created_on:String, updated_on:String) {
        
        self.id = id
        self.project = project
        self.tracker = tracker
        self.status = status
        self.priority = priority
        self.author = author
        self.subject = subject
        self.description = description
        self.start_date = start_date
        self.estimated_hours = estimated_hours
        self.done_ratio = done_ratio
        self.created_on = created_on
        self.updated_on = updated_on
        
    }
}
