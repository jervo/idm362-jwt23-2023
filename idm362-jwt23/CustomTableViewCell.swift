//
//  CustomTableViewCell.swift
//  idm362-jwt23
//
//  Created by Jervis Thompson on 3/6/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet weak var fName: UILabel!
  @IBOutlet weak var fNumStr: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
