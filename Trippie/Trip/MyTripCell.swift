//
//  MyTripCell.swift
//  Trippie
//
//  Created by Helen Agha on 10/1/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit

class MyTripCell: UITableViewCell{
    
    @IBOutlet weak var tripDate: UILabel!
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripImage: UIImageView!
    
    func setCell(image:String,name:String,date:String){
       
        self.tripDate?.text = date
        self.tripName?.text = name
        self.tripImage?.image = UIImage(named: image)
        
        
    }
}
