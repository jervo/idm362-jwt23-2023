//
//  ViewController.swift
//  idm362-jwt23
//
//  Created by Jervis Thompson on 1/19/23.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  @IBOutlet weak var nameText: UITextField!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  @IBOutlet weak var PopUpButton: UIButton!
  
  
  // Global vars
  var vCounter:Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    // Change text color
    displayLabel.textColor = UIColor(named: "Prince")
    displayLabel.text = "Loaded..."
    
    // Start Spinner
    spinner.startAnimating()
    
    // Set up Pop Up Menu
    SetUpPopUpButton()
  }
  
  @IBAction func AddBTN(_ sender: Any) {
    vCounter += 1
    displayLabel.text = String(vCounter)
  }
  
  @IBAction func TouchMe(_ sender: Any) {
//    displayLabel.text = "Well Hello There."
    displayLabel.text = "Well Hello there \(nameText.text!)"
  }
  
  // Disable keyboard when user touches else where
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  @IBAction func SliderMoving(_ sender: UISlider) {
    displayLabel.text = "Slider value is \(sender.value)"
  }
  
  @IBAction func SpinSwitch(_ sender: UISwitch) {
    if (sender.isOn) {
      spinner.startAnimating()
    } else {
      spinner.stopAnimating()
    }
  }
  
  @IBAction func FinishLine(_ sender: UISegmentedControl) {
    displayLabel.text = "You Finished: \(sender.titleForSegment(at: sender.selectedSegmentIndex)!)"
  }
  
  func SetUpPopUpButton() {
    let optionsObj = {
//      (action : UIAction) in print(action.title)
      (action : UIAction) in self.displayLabel.text = action.title
    }
    
    PopUpButton.menu = UIMenu(children : [
      UIAction(title: "Mild", state : .on, handler: optionsObj),
      UIAction(title: "Medium", handler: optionsObj),
      UIAction(title: "Spicy", handler: optionsObj)
    ])
    
    PopUpButton.showsMenuAsPrimaryAction = true
    PopUpButton.changesSelectionAsPrimaryAction = true
    PopUpButton.tintColor = UIColor(named: "Prince")
  }
  
  
}

