//
//  HeadingCell.swift
//  Trippie
//
//  Created by Helen Agha on 10/6/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit

class HeadingCell: UITableViewCell {
    @IBOutlet weak var headingImage: UIImageView!
    
    @IBOutlet weak var headingTitle: UILabel!
    
    func setCell(title:String,image:String){
        self.headingImage.image = UIImage(named: image)
        self.headingTitle.text = title
    }
}
