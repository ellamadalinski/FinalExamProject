//
//  ViewControllerClubs.swift
//  FinalExamProject
//
//  Created by Daniel Vega on 11/30/21.
//

import UIKit

class ViewControllerClubs: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    var blankStudentArray = [Students]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    func presentAlertController() {
        let alertController = UIAlertController(title: "Club Name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Club Name"
            
        }
        
        let addClubAction = UIAlertAction(title: "Add",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let clubName = textFields[0].text {
                                                StaticStuff.clubArray.append(Club(c: clubName, sa: [Students]))
                                               
                                                
                                            }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addClubAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
