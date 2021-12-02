//
//  ViewControllerClasses.swift
//  FinalExamProject
//
//  Created by Daniel Vega on 11/30/21.
//

import UIKit

class ViewControllerClasses: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var addButtonAction: UIButton!
    
    var blankStudentArray = [Students]()
    var clickedClassFosho = Class(c: "default", cp: "default", sa: [Students]())
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        self.presentAlertController()
        
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Class Name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Class Name"
            
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Class Period"
        }
        
        let addClassAction = UIAlertAction(title: "Add",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let className = textFields[0].text {
                                                if let classPeriod = textFields[1].text{
                                                    StaticStuff.classesArray.append(Class(c: className, cp: classPeriod, sa: [Students]()))
                                                }
                                               
                                                
                                            }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addClassAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    //table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticStuff.classesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticStuff.classesArray[indexPath.row].className
        cell.detailTextLabel?.text = StaticStuff.classesArray[indexPath.row].classPeriod
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StaticStuff.classesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
          
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        clickedClassFosho = StaticStuff.classesArray[indexPath.row]
       performSegue(withIdentifier: "classesToStudents", sender: nil)
            
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "classesToStudents" {
            let nvc = segue.destination as! StudentNamesViewController
            nvc.incomingClass = clickedClassFosho
            print("jamal")
        }
    }

}
