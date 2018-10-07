//
//  SampleDataLoader.swift
//  Trippie
//
//  Created by Helen Agha on 10/2/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class SampleDataLoader{
    
    var array: [NSManagedObject] = []
    init(){
        
    }
    func loadData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Trip")
        do {
           array = try managedContext.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        if array.count == 0 {
        var entity = NSEntityDescription.entity(forEntityName: "Trip", in: managedContext)!
        let samptrip_1 = NSManagedObject(entity: entity,insertInto: managedContext)
        //Sample Trip One
        samptrip_1.setValue("Paris", forKeyPath: "name")
        samptrip_1.setValue("paris-image", forKeyPath: "image")
        samptrip_1.setValue("Day One", forKeyPath: "dates")
        samptrip_1.setValue(false,forKeyPath:"isHeading")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        //Sample Trip Two
        entity = NSEntityDescription.entity(forEntityName: "Trip", in: managedContext)!
        let samptrip_2 = NSManagedObject(entity: entity,insertInto: managedContext)
        samptrip_2.setValue("Rome", forKeyPath: "name")
        samptrip_2.setValue("rome-image", forKeyPath: "image")
        samptrip_2.setValue("Day Two", forKeyPath: "dates")
        samptrip_2.setValue(false,forKeyPath:"isHeading")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        //Sample Trip Three
        entity = NSEntityDescription.entity(forEntityName: "Trip", in: managedContext)!
        let samptrip_3 = NSManagedObject(entity: entity,insertInto: managedContext)
        samptrip_3.setValue("New York", forKeyPath: "name")
        samptrip_3.setValue("ny-image", forKeyPath: "image")
        samptrip_3.setValue("Day Three", forKeyPath: "dates")
        samptrip_3.setValue(false,forKeyPath:"isHeading")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        //Heading
            
      
        //Insert Itinerary Events Into Core Data
            
        //Paris
        
        
        entity = NSEntityDescription.entity(forEntityName: "ItineraryEvent", in: managedContext)!
        var event = NSManagedObject(entity: entity,insertInto: managedContext)
        event.setValue(3, forKeyPath: "type")
        event.setValue("Paris", forKeyPath: "tripname")
        event.setValue("Palais du Luxembourg", forKeyPath: "eventname")
        event.setValue("15 rue de Vaugirard, 75006 Paris, France", forKeyPath: "address")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        entity = NSEntityDescription.entity(forEntityName: "ItineraryEvent", in: managedContext)!
        event = NSManagedObject(entity: entity,insertInto: managedContext)
        event.setValue(4, forKeyPath: "type")
        event.setValue("Paris", forKeyPath: "tripname")
        event.setValue("Le Comptoir de la Gastronomie", forKeyPath: "eventname")
        event.setValue("34 rue Montmartre, 75001 Paris, France", forKeyPath: "address")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        //Rome
        
        entity = NSEntityDescription.entity(forEntityName: "ItineraryEvent", in: managedContext)!
        event = NSManagedObject(entity: entity,insertInto: managedContext)
        event.setValue(1, forKeyPath: "type")
        event.setValue("Rome", forKeyPath: "tripname")
        event.setValue("Hotel Artemide", forKeyPath: "eventname")
        event.setValue("Via Nazionale 22, 00184 Roma, Italy", forKeyPath: "address")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        entity = NSEntityDescription.entity(forEntityName: "ItineraryEvent", in: managedContext)!
        event = NSManagedObject(entity: entity,insertInto: managedContext)
        event.setValue(2, forKeyPath: "type")
        event.setValue("Rome", forKeyPath: "tripname")
        event.setValue("Rome Termini", forKeyPath: "eventname")
        event.setValue("Piazza dei Cinquecento 1, Rome 00185", forKeyPath: "address")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        // New York
        entity = NSEntityDescription.entity(forEntityName: "ItineraryEvent", in: managedContext)!
        event = NSManagedObject(entity: entity,insertInto: managedContext)
        event.setValue(0, forKeyPath: "type")
        event.setValue("New York", forKeyPath: "tripname")
        event.setValue("John F. Kennedy Intl Airport", forKeyPath: "eventname")
        event.setValue("4 World Trade Center, 150 Greenwich Street, New York, NY 10007 ", forKeyPath: "address")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        entity = NSEntityDescription.entity(forEntityName: "ItineraryEvent", in: managedContext)!
        event = NSManagedObject(entity: entity,insertInto: managedContext)
        event.setValue(4, forKeyPath: "type")
        event.setValue("New York", forKeyPath: "tripname")
        event.setValue("Eataly Downtown", forKeyPath: "eventname")
        event.setValue("101 Liberty St, Fl 3, New York, NY 10006", forKeyPath: "address")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        }
    }
    
}
