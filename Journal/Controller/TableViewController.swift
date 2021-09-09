//
//  TableViewController.swift
//  Journal
//
//  Created by Zachary Buffington on 9/9/21.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryManager.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        let entry = EntryManager.shared.entries[indexPath.row]
        cell.detailTextLabel?.text = "\(entry.timestamp)"
        cell.textLabel?.text = entry.title

        

        return cell
    }
    

   

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = EntryManager.shared.entries[indexPath.row]
            
            EntryManager.shared.delete(entry: entry)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
    
            
        }    
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editExistingEntry",
              
             let indexPath = tableView.indexPathForSelectedRow,
             
             let destination = segue.destination as? ViewController else { return }
        
        let entry = EntryManager.shared.entries[indexPath.row]
        
        destination.entry = entry 
        
              
              
        
    }


}
