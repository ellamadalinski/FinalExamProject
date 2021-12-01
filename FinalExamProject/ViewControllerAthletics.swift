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
        let alertController = UIAlertController(title: "Athletics name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Athletics name"
            
        }
        
        let continueAction = UIAlertAction(title: "Add",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let className = textFields[0].text {
                                                if let season = textFields[1].text {
                                                StaticStuff.athleticArray.append(Athletic(a: className, sa: [Students](), s:text))
                                               
                                                }
                                            }
            self.tableViewOutlet.reloadData()
        }

        alertController.addAction(continueAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticStuff.athleticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticStuff.athleticArray[indexPath.row].athleticName
        return cell
    }
    

   

}
