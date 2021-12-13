//
//  PlayerNamesViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/1/21.
//

import UIKit

class PlayerNamesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableViewOutlet: UITableView!
    var incomingAthletic = Athletic(a: "default", sa: [Students](), s: "default")
    var whichClicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomingAthletic.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = incomingAthletic.studentsArray[indexPath.row].name
        return cell
    }

    @IBAction func addPlayerAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Player Name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Player Name"
            
        }
        
        
        let addPlayerAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }
                                            
                if let playerName = textFields[0].text {
                                                
                    self.incomingAthletic.studentsArray.append(Students(n: playerName, dm: [Int](), sn: "", w: 0, h: 0, y: 0, a: false))
                    
                }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addPlayerAction)
        
        self.present(alertController,
                     animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichClicked = indexPath.row
        performSegue(withIdentifier: "playersToPlayerInfo", sender: nil)
    }
    
}
