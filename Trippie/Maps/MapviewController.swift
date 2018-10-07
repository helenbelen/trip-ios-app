//
//  MapviewController.swift
//  Trippie
//
//  Created by Helen Agha on 10/4/18.
//  Copyright © 2018 Helen Agha. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Contacts
import CoreData

class MapViewController:ViewController{
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 250
    let locationManager = CLLocationManager()
    var selectedCity:String?
    var selectedAddress:String?
    var selectedName:String?
    var artwork: Artwork!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthorizationStatus()
        coordinates(forAddress: selectedAddress!){
            (location) in guard let location = location else{
                print("Error")
                return
            }
            self.artwork = Artwork(title:self.selectedName!,locationName: self.selectedAddress!,discipline:"Place",coordinate: CLLocationCoordinate2D(latitude: location.latitude,longitude: location.longitude))
            self.mapView.addAnnotation(self.artwork)
            self.centerMapOnLocation(location: CLLocation(latitude: location.latitude, longitude: location.longitude))
        }
    }
    
    
    //tool kit function
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) ->Void){
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            
            (placemarks,error) in guard error == nil else{
                print("Geocoding Error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
          
        }
    }
    
    
    func checkLocationAuthorizationStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion,animated: true)
    }
    
   
    @IBAction func openInMaps(_ sender: Any) {
        
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
        artwork?.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}
