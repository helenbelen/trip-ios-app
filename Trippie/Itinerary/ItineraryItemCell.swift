//
//  ItineraryItemCell.swift
//  Trippie
//
//  Created by Helen Agha on 10/1/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit

class IntineraryItemCell : UITableViewCell {
    @IBOutlet weak var celldescription: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    var tripName:String?
    var itemAddress:String?
    var name:String?
    func setCell(image:String,name:String,trip:String,address:String){
        self.name = name
        self.celldescription?.text = self.name
        self.tripName = trip
        self.itemAddress = address
        self.icon?.image = UIImage(named: image)
    }
    
}
