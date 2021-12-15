//
//  PlayerAttendanceViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/10/21.
//

import UIKit

class PlayerAttendanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    var newIncomingAthletic = Athletic(a: "", sa: [Students](), s: "")
    var global = [IndexPath]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.tableViewOutlet.allowsMultipleSelection = true
        self.tableViewOutlet.allowsMultipleSelectionDuringEditing = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newIncomingAthletic.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = newIncomingAthletic.studentsArray[indexPath.row].name
        global.append(indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        newIncomingAthletic.studentsArray[indexPath.row].absent = true
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        newIncomingAthletic.studentsArray[indexPath.row].absent = false
    }
    
    @IBAction func markAbsentAction(_ sender: UIButton){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let currentDate = dateFormatter.string(from: date)
        var index = 0
        while(index < newIncomingAthletic.studentsArray.count) {
            if newIncomingAthletic.studentsArray[index].absent {
                newIncomingAthletic.studentsArray[index].daysMissed.append(currentDate)
            }
            else {
                
            }
            index += 1
        }
        var yuh = 0
        var insideYuh = 0
        while(yuh < newIncomingAthletic.studentsArray.count) {
            while(insideYuh < global.count) {
             
                tableViewOutlet.deselectRow(at: global[insideYuh], animated: true)
                insideYuh += 1
            }
            newIncomingAthletic.studentsArray[yuh].absent = false
            yuh += 1
          
        }
        
    }
    
  
}
