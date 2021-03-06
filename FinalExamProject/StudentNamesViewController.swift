//
//  StudentNamesViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/1/21.
//

import UIKit

class StudentNamesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    var incomingClass = Class(c: "default", cp: "default", sa: [Students]())
    var whichClicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentsToStudentInfo" {
            let nvc = segue.destination as! StudentInfoViewController
            nvc.incomingStudent = incomingClass.studentsArray[whichClicked]
        }
        if segue.identifier == "studentNamesToAttendance" {
            let nvc = segue.destination as! StudentAttendanceViewController
            nvc.newIncomingClass = incomingClass
        }
    }
    
    
    @IBAction func addStudentAction(_ sender: UIButton) {
        self.presentAlertController()
    }
    
    func presentAlertController(){
        let alertController = UIAlertController(title: "Student Name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Student Name"
            
        }
        
        
        let addNameAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                                            
                if let studentName = textFields[0].text {
                                                
                    self.incomingClass.studentsArray.append(Students(n: studentName, dm: [String](), sn: [String](), w: 0, h: 0, y: 0, a: false))
                    
                }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addNameAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    //table view stuff
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomingClass.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = incomingClass.studentsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       // when you click on another cell it deselects the previous cell you were clicked on
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        whichClicked = indexPath.row
        performSegue(withIdentifier: "studentsToStudentInfo", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            incomingClass.studentsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
          
        }
//        if editingStyle == .none{
//            let alertController = UIAlertController(title: "Change Name", message: nil, preferredStyle: .alert)
//            alertController.addTextField { (textField) in
//                textField.placeholder = "Change Name"
//
//            }
//
//
//            let changeNameAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
//
//                    if let studentName = textFields[0].text {
//
//                        self.incomingClass.studentsArray[self.whichClicked].name = studentName
//
//                    }
//                self.tableViewOutlet.reloadData()
//            }
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            alertController.addAction(cancelAction)
//            alertController.addAction(changeNameAction)
//            self.present(alertController,
//                         animated: true)
//        }
    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let action = UIContextualAction(style: .normal, title: "Change Name") { [weak self] (action, view, completionHandler) in
        
                    let alertController = UIAlertController(title: "Change Name", message: nil, preferredStyle: .alert)
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Change Name"
        
                    }
        
        
                    let changeNameAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
        
                            if let studentName = textFields[0].text {
        
                                self?.incomingClass.studentsArray[indexPath.row].name = studentName
                              
                            }
                        tableView.reloadData()
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertController.addAction(cancelAction)
                    alertController.addAction(changeNameAction)
        
        self?.present(alertController,animated: true)
        
        
        
        completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    @IBAction func cellHeld(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            let touchPoint = sender.location(in: tableViewOutlet)
            if let indexPath = tableViewOutlet.indexPathForRow(at: touchPoint) {
                whichClicked = indexPath.row
            }
        }
        
        
        let alertController = UIAlertController(title: "Change Name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Change Name"
            
        }
        
        
        let changeNameAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                                            
                if let studentName = textFields[0].text {
                   
                    self.incomingClass.studentsArray[self.whichClicked].name = studentName
                    
                }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let goToStudentsScreen = UIAlertAction(title: "Go to student screen", style: .default) { blah in
            self.performSegue(withIdentifier: "studentsToStudentInfo", sender: nil)
        }
       
        alertController.addAction(cancelAction)
        alertController.addAction(changeNameAction)
        alertController.addAction(goToStudentsScreen)
        
       
        self.present(alertController,
                     animated: true)
        
     
    
    
}
}
