//
//  StudentAttendanceViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/10/21.
//

import UIKit

class StudentAttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var newIncomingClass = Class(c: "default", cp: "default", sa: [Students]())
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        newIncomingClass.studentsArray[indexPath.row].absent = true
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        newIncomingClass.studentsArray[indexPath.row].absent = false
    }
    
    
    @IBAction func markAsAbsentAction(_ sender: UIButton) {
        
    }
    
    

}
