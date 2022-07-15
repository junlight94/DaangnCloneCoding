//
//  MyTownTableViewCell.swift
//  DaangnCloneCoding
//
//  Created by Junyoung Lee on 2022/07/14.
//

import UIKit

class MyTownTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var btnClick: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
