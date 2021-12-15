//
//  MemberAttendanceViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/10/21.
//

import UIKit

class MemberAttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    
    var newIncomingMember = Club(c: "", sa: [Students]())
    var global = [IndexPath]()
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.tableViewOutlet.allowsMultipleSelection = true
        self.tableViewOutlet.allowsMultipleSelectionDuringEditing = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newIncomingMember.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = newIncomingMember.studentsArray[indexPath.row].name
        global.append(indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        newIncomingMember.studentsArray[indexPath.row].absent = true
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        newIncomingMember.studentsArray[indexPath.row].absent = false
    }
    
    @IBAction func markAbsentAction(_ sender: UIButton) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let currentDate = dateFormatter.string(from: date)
        var index = 0
        while(index < newIncomingMember.studentsArray.count) {
            if newIncomingMember.studentsArray[index].absent {
                newIncomingMember.studentsArray[index].daysMissed.append(currentDate)
            }
            else {
                
            }
            index += 1
        }
        var yuh = 0
        var insideYuh = 0
        while(yuh < newIncomingMember.studentsArray.count) {
            while(insideYuh < global.count) {
             
                tableViewOutlet.deselectRow(at: global[insideYuh], animated: true)
                insideYuh += 1
            }
            newIncomingMember.studentsArray[yuh].absent = false
            yuh += 1
          
        }
        
    }
    


}
