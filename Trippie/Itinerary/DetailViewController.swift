//
//  DetailViewController.swift
//  Trippie
//
//  Created by Helen Agha on 10/1/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DetailViewController: UIViewController{
    var itineraryEvents: [NSManagedObject] = []
    var tripname:String = ""
    var selectedCity:String?
    var selectedAddress:String?
    var selectedName:String?
    @IBOutlet weak var itinTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //itinTable.register(IntineraryItemCell.self, forCellReuseIdentifier: "eventCell")
        itinTable.delegate = self as? UITableViewDelegate
        itinTable.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ItineraryEvent")
        fetchRequest.predicate = NSPredicate(format: "tripname == %@", self.tripname)
        do {
            itineraryEvents = (try managedContext.fetch(fetchRequest))
            
            itinTable.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMapInfo"{
            if let destinationVC = segue.destination as? MapViewController{
                destinationVC.selectedCity = self.selectedCity
                destinationVC.selectedAddress = self.selectedAddress
                destinationVC.selectedName = self.selectedName
            }
        }
    }
    
}
extension DetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itineraryEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let event = itineraryEvents[indexPath.row]
        
        let cell:IntineraryItemCell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! IntineraryItemCell

        var iconimage:String = ""
        switch event.value(forKeyPath:"type") as! Int32{
            
            case 0:
                //A flight event
                iconimage = "plane"
            case 1:
                // Any Event like a party or tour
                iconimage = "bluedot"
            case 2:
                // Group Travel Event
                iconimage = "bus"
            case 3:
                // Museum Event
                iconimage = "photo"
            case 4:
                iconimage = "eat"
            default:
                iconimage = "bluedot"
        }
        
        cell.setCell(image: iconimage, name: event.value(forKeyPath: "eventname") as! String, trip: event.value(forKeyPath: "tripname") as! String, address: event.value(forKeyPath: "address") as! String)
        return cell
        
    }
    
    
}

extension DetailViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!) as! IntineraryItemCell
        
        //getting the text of that cell
        selectedCity = currentCell.tripName as String!
        selectedName = currentCell.name as String!
        selectedAddress = currentCell.itemAddress as String!
        performSegue(withIdentifier: "showMapInfo", sender: self)
    }
    
    
}
