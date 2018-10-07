//
//  ViewController.swift
//  Trippie
//
//  Created by Helen Agha on 10/1/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var trips: [NSManagedObject] = []
    var headings: [NSManagedObject] = [ ]
    var selectedRow:String = ""
    @IBOutlet weak var tripTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tripTable.register(MyTripCell.self, forCellReuseIdentifier: "tripCell")
        tripTable?.delegate = self
        tripTable?.dataSource = self
        
    }
   
    @IBAction func signOut(_ sender: Any) {
        performSegue(withIdentifier: "showLoginScreen", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        super.viewWillAppear(animated)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Trip")
        do {
            trips = (try managedContext.fetch(fetchRequest))
            tripTable?.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
      
        
    }
  
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTripDetail"{
            if let destinationVC = segue.destination as? DetailViewController{
                destinationVC.tripname = selectedRow
            }
        }
    }
   

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let trip = trips[indexPath.row]
        
        let cell:MyTripCell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! MyTripCell
        
        cell.setCell(image: trip.value(forKeyPath: "image") as! String, name: trip.value(forKeyPath: "name") as! String, date: trip.value(forKeyPath: "dates") as! String)
        
        return cell
       
    }
   
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow

        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!) as! MyTripCell

        //getting the text of that cell
        selectedRow = currentCell.tripName!.text as String!
        performSegue(withIdentifier: "showTripDetail", sender: self)
    }
    
    
}
