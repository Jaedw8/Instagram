//
//  InstaCell.swift
//  Instagram
//
//  Created by Jasmine Edwards on 3/3/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstaCell: UITableViewCell {
    
    @IBOutlet weak var InstaImage: PFImageView!
    
    @IBOutlet weak var caption: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
