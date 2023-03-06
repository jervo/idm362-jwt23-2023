//
//  TableViewController.swift
//  idm362-jwt23
//
//  Created by Jervis Thompson on 3/2/23.
//

import UIKit

class TableViewController: UITableViewController {
  
  // Global VARS
  
  var fNames: [String] = ["Judith", "Jennifa", "John", "Joseph", "Jervis", "Jack"]
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return fNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
      cell.textLabel?.text = fNames[indexPath.row]

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          // Delete from Array
          fNames.remove(at: indexPath.row)
          // Reload Table
          tableView.reloadData()
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
  
  @IBAction func addName(_ sender: Any) {
    // Create alert to get New Name from User
    let alertObj = UIAlertController(title: "New Frined", message: "Add new name", preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) {
      [unowned self] action in
      guard let textField = alertObj.textFields?.first,
            let nameToSave = textField.text else {
        return
      }
      // Update Array
      self.fNames.append(nameToSave)
      // Reload Table
      self.tableView.reloadData()
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    
    alertObj.addTextField()
    alertObj.addAction(saveAction)
    alertObj.addAction(cancelAction)
    
    present(alertObj, animated: true)
  }
  
  


  // MARK: - Navigation
  
  var selRowNum:Int = 0
  var selRowName:String = ""
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Row selected " + indexPath.row.description)
    selRowNum = indexPath.row
    selRowName = fNames[selRowNum]
    
    // Go to deatil View
    performSegue(withIdentifier: "showDetail", sender: nil)
  }
  
  

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    
    if segue.identifier == "showDetail" {
      let detailObj = segue.destination as! DeatilsViewController
      detailObj.ndxNum = selRowNum
      detailObj.incomingName = selRowName
    }
    
  }


}
