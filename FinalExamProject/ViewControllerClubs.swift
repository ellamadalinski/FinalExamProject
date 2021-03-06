//
//  ViewControllerClubs.swift
//  FinalExamProject
//
//  Created by Daniel Vega on 11/30/21.
//

import UIKit

class ViewControllerClubs: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var clickedClub = Club(c: "default", sa: [Students]())
    var blankStudentArray = [Students]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        if let clubs = UserDefaults.standard.data(forKey: "clubs") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Club].self, from: clubs){
                StaticStuff.clubArray = decoded
               
            }
        }
       
        
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        self.presentAlertController()
    }
    
    

    func presentAlertController() {
        let alertController = UIAlertController(title: "Club Name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Club Name"
            
        }
        
        let addClubAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in   guard let textFields = alertController?.textFields else { return }
                                            
              if let clubName = textFields[0].text {
                       StaticStuff.clubArray.append(Club(c: clubName, sa: [Students]()))
                  let encoder = JSONEncoder()
                  
                  if let encoded = try? encoder.encode(StaticStuff.clubArray) {
                      
                      UserDefaults.standard.set(encoded, forKey: "clubs")
                      
                  }
                                                
                                            }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addClubAction)
        
        self.present(alertController,
                     animated: true)
       
    }
    
    //table view stuff
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StaticStuff.clubArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = StaticStuff.clubArray[indexPath.row].clubName
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StaticStuff.clubArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
          
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        clickedClub = StaticStuff.clubArray[indexPath.row]
        performSegue(withIdentifier: "clubsToMembers", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clubsToMembers" {
            let nvc = segue.destination as! MemberNamesViewController
            nvc.incomingClub = clickedClub
            print("jamal is clubbing")
        }
    }

}
