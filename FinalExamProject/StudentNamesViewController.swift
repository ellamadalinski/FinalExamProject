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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomingClass.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = incomingClass.studentsArray[indexPath.row].name
        return cell
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
                                                
                    self.incomingClass.studentsArray.append(Students(n: studentName))
                    
                }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addNameAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    
}
