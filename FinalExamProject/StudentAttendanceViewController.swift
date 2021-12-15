//
//  StudentAttendanceViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/10/21.
//

import UIKit

class StudentAttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var newIncomingClass = Class(c: "", cp: "", sa: [Students]())
    @IBOutlet weak var tableViewOutlet: UITableView!
    var global = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.tableViewOutlet.allowsMultipleSelection = true
        self.tableViewOutlet.allowsMultipleSelectionDuringEditing = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newIncomingClass.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = newIncomingClass.studentsArray[indexPath.row].name
        global.append(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        newIncomingClass.studentsArray[indexPath.row].absent = true
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        newIncomingClass.studentsArray[indexPath.row].absent = false
    }
    
    
    @IBAction func markAsAbsentAction(_ sender: UIButton) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let currentDate = dateFormatter.string(from: date)
        var index = 0
        while(index < newIncomingClass.studentsArray.count) {
            if newIncomingClass.studentsArray[index].absent {
                newIncomingClass.studentsArray[index].daysMissed.append(currentDate)
            }
            else {
                
            }
            index += 1
        }
        var yuh = 0
        var insideYuh = 0
        while(yuh < newIncomingClass.studentsArray.count) {
            while(insideYuh < global.count) {
             
                tableViewOutlet.deselectRow(at: global[insideYuh], animated: true)
                insideYuh += 1
            }
            newIncomingClass.studentsArray[yuh].absent = false
            yuh += 1
          
        }
        
    }
    
    

}
