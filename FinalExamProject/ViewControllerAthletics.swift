//
//  ViewControllerAthletics.swift
//  FinalExamProject
//
//  Created by Daniel Vega on 11/30/21.
//

import UIKit

class ViewControllerAthletics: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        self.presentAlertController()
        
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Athletics Name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Team Name"
            
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Season"
            
        }
        
        let continueAction = UIAlertAction(title: "Add",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let className = textFields[0].text {
                                                if let season = textFields[1].text {
                                                StaticStuff.athleticArray.append(Athletic(a: className, sa: [Students](), s: season))
                                               
                                                }
                                            }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    

    
        // table view stuff
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticStuff.athleticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticStuff.athleticArray[indexPath.row].athleticName
        cell.detailTextLabel?.text = StaticStuff.athleticArray[indexPath.row].season
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StaticStuff.athleticArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
          
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       performSegue(withIdentifier: "athleticsToPlayers", sender: nil)
            
        
    }
   

}
