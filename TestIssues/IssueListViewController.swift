//
//  ViewController.swift
//  TestIssues
//
//  Created by Juan Carlos Cardozo on 22/7/17.
//  Copyright © 2017 Juan Carlos Cardozo. All rights reserved.
//

import UIKit
import SwiftyJSON

class IssueListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Data
    var itemSelected:Issue?
    var iProject = [iData]()
    var iTracker = [iData]()
    var iStatus = [iData]()
    var iPriority = [iData]()
    var iAuthor = [iData]()
    var dataFromAPI = [Issue]()
    var chosenCellIndex = 0
    
    // MARK: Static Labels
    @IBOutlet weak var labelIssuesTitle: UILabel!
    
    // MARK: Views
    @IBOutlet weak var dataTableView: UITableView!
    @IBOutlet weak var viewIssuesTitle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style
        navigationController?.customNavBar()
        labelIssuesTitle.titleWhiteLight()
        viewIssuesTitle.backgroundColor = Color.greyColor
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
        definesPresentationContext = true
        
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFromAPI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "IssueCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyTableViewCell
        
        itemSelected = dataFromAPI[indexPath.row]
        
        let cellSuject = itemSelected?.subject
        let cellDescription = itemSelected?.description
        let cellDate = itemSelected?.start_date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: cellDate!)
        
        let calendar = NSCalendar.current
    
        var month = 0
        var day = 0
        
        if ((date) != nil)
        {
            let components = calendar.dateComponents([.day, .month, .year], from: date!)
            month = components.month!
            day = components.day!
        }
        
        let stringMonth = MyHelpers.getMonth(intMonth: month)

        var titleAttributes = [String : Any]()
        titleAttributes[NSForegroundColorAttributeName] = Color.greyColor
        titleAttributes[NSFontAttributeName] = UIFont(name: "OpenSans-CondensedBold", size: 14)!
        
        var textAttributes = [String : Any]()
        textAttributes[NSForegroundColorAttributeName] = Color.greyColor
        textAttributes[NSFontAttributeName] = UIFont(name: "OpenSans-CondensedLight", size: 14)!
        
        let sujectTitleString = NSAttributedString(string: "Suject: ", attributes: titleAttributes)
        let sujectTextString = NSAttributedString(string: cellSuject!, attributes: textAttributes)
        let concatSujectString = NSMutableAttributedString(attributedString: sujectTitleString)
        concatSujectString.append(sujectTextString)
        
        let descriptionTitleString = NSAttributedString(string: "Description: ", attributes: titleAttributes)
        let descriptionTextString = NSAttributedString(string: cellDescription!, attributes: textAttributes)
        let concatDescriptionString = NSMutableAttributedString(attributedString: descriptionTitleString)
        concatDescriptionString.append(descriptionTextString)
        
        cell.sujectLabel.attributedText = concatSujectString
        cell.descriptioLabel.attributedText = concatDescriptionString
        cell.dayLabel.text = String(day)
        cell.monthLabel.text = stringMonth
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heigth = 130
        return CGFloat(heigth)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemSelected = dataFromAPI[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            let detailVC = segue.destination as! IssueDetailViewController
            detailVC.issue = itemSelected
            
        }
    }
    
    func loadData(){
        
        IssuesApi.sharedInstance.getAllIssuesRequest(myView: self.view, completion: {(issues) -> Void in
            
            let NumOfRows = issues.count
            
            for i in 0...(NumOfRows-1){
                
                var newRow = issues[i]
                
                self.iProject.removeAll()
                self.iTracker.removeAll()
                self.iStatus.removeAll()
                self.iPriority.removeAll()
                self.iAuthor.removeAll()
                
                var NumData = 0
                
                let issueProject = newRow["project"]
                NumData = issueProject.count
                self.loadDatainArray(apiData: issueProject, NumData: NumData, myCase: 1)
                
                let issueTracker = newRow["tracker"]
                NumData = issueTracker.count
                self.loadDatainArray(apiData: issueTracker, NumData: NumData, myCase: 2)
                
                let issueStatus = newRow["status"]
                NumData = issueStatus.count
                self.loadDatainArray(apiData: issueStatus, NumData: NumData, myCase: 3)
                
                let issuePriority = newRow["priority"]
                NumData = issuePriority.count
                self.loadDatainArray(apiData: issuePriority, NumData: NumData, myCase: 4)
                
                let issueAuthor = newRow["author"]
                NumData = issueAuthor.count
                self.loadDatainArray(apiData: issueAuthor, NumData: NumData, myCase: 5)
                
                let NewIssue = Issue(
                    id: String(describing: newRow["id"].int) as String!,
                    project: self.iProject,
                    tracker: self.iTracker,
                    status: self.iStatus,
                    priority: self.iPriority,
                    author: self.iAuthor,
                    subject: newRow["subject"].string ?? ""as String!,
                    description: newRow["description"].string ?? "" as String!,
                    start_date: newRow["start_date"].string ?? "" as String!,
                    estimated_hours: newRow["estimated_hours"].string ?? "0" as String!,
                    done_ratio: String(describing: newRow["done_ratio"].int!) ?? "0" as String!,
                    created_on: newRow["created_on"].string ?? "" as String!,
                    updated_on: newRow["updated_on"].string ?? "" as String!
                )
                
                self.dataFromAPI.append(NewIssue!)
            }
            self.dataTableView.reloadData()
        })
        
    }
    
    func loadDatainArray(apiData:JSON, NumData:Int, myCase:Int){

        print("apiData: \(apiData)")
        
                let NewItem = iData(
                    id: apiData["id"].string ?? "0" as String!,
                    name: apiData["name"].string ?? "" as String!
                )
                
                switch myCase {
                case 1:
                    self.iProject.append(NewItem!)
                case 2:
                    self.iTracker.append(NewItem!)
                case 3:
                    self.iStatus.append(NewItem!)
                case 4:
                    self.iPriority.append(NewItem!)
                case 5:
                    self.iAuthor.append(NewItem!)
                default:
                    return
                }
        
    }
    
}





