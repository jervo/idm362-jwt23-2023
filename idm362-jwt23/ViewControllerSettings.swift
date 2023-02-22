//
//  ViewControllerSettings.swift
//  idm362-jwt23
//
//  Created by Jervis Thompson on 2/9/23.
//

import UIKit
// jwt.. Add Audio Video library
import AVFoundation

var myAudioPlayerObj = AVAudioPlayer()

class ViewControllerSettings: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    
    // Setup sound obj
    let mySound = Bundle.main.path(forResource: "sounds/halo1", ofType: "mp3")
    
    do {
      myAudioPlayerObj = try
      AVAudioPlayer(contentsOf: URL(fileURLWithPath: mySound!))
      myAudioPlayerObj.prepareToPlay()
      print("Sound file loaded and prepped!")
    } catch {
      print(error)
    }
  }

  @IBAction func toggleHalo(_ sender: Any) {
    print("toggleHalo called")
    if (myAudioPlayerObj.isPlaying) {
      myAudioPlayerObj.stop()
    } else {
      myAudioPlayerObj.play()
    }
  }
  
  @IBAction func showAlert(_ sender: Any) {
    let myAlertObj = UIAlertController(title: "Delete ALL Records", message: "Are you Sure!", preferredStyle: .alert)
    
    myAlertObj.addAction(UIAlertAction(title: "YES", style: .default, handler: {
      (UIAlertAction) in
      print("User wants to DELETE ALl RECORDS")
    }))
    
    myAlertObj.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {
      (UIAlertAction) in
      print("User Canceled")
    }))
    
    myAlertObj.view.tintColor = UIColor.init(named: "Prince")
    
    self.present(myAlertObj, animated: true)
  }
  
  var toogleFlag: Bool = false
  
  @IBOutlet weak var peepBtn: UIButton!
  
  @IBAction func peepBtnFun(_ sender: Any) {
    if (toogleFlag == true) {
      peepBtn.tintColor = UIColor.init(named: "AccentColor")
      peepBtn.setBackgroundImage(UIImage(named: "people"), for: .normal)
      toogleFlag = false
    } else {
      peepBtn.tintColor = UIColor.init(named: "Prince")
      peepBtn.setBackgroundImage(UIImage(named: "user_man_woman"), for: .normal)
      toogleFlag = true
    }
  }
  
  
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
