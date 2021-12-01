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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
    }
    
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        self.presentAlertController()
        
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "class name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "class name"
            
        }
        
        let continueAction = UIAlertAction(title: "Continue",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let className = textFields[0].text {
                                                StaticStuff.classesArray.append(Class(c: className, sa: [Students]()))
                                               
                                                
                                            }
            self.tableViewOutlet.reloadData()
        }

        alertController.addAction(continueAction)
        
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
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StaticStuff.classesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
          
        }
    }

}
