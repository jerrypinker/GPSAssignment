//
//  ViewController.swift
//  GPSAssignment
//
//  Created by JERRY CHANG on 1/15/15.
//  Copyright (c) 2015 com.jerrysays. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager: CLLocationManager!
    
    @IBOutlet weak var mapView: MKMapView!
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
        
        //02 keep tracking if a user travels over 1 mile
        locationManager.distanceFilter = 1609.34
        locationManager.startUpdatingLocation()
        
        mapView.userLocation
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
    }
    
    //CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        //println("locations = \(locations)")
        let location = locations.last as CLLocation
        
        if currentLocation == nil {
            currentLocation = locations.last as? CLLocation
            
            //01 Drop a pin for the current position
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
            
             //Add annotation
            let annotation = MKPointAnnotation()
            annotation.setCoordinate(center)
            annotation.title = "Title"
            annotation.subtitle = "Subtitle"
            mapView.addAnnotation(annotation)
            
        }else{
            
            //03 Dropping another pin
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
 
            let annotation = MKPointAnnotation()
            annotation.setCoordinate(center)
            annotation.title = "Title"
            annotation.subtitle = "Subtitle"
            mapView.addAnnotation(annotation)

            //04 Show notification when over a mile
            var notification: UILocalNotification = UILocalNotification()
            notification.category = "FIRST_CATEGORY"
            notification.alertBody = "Hello notification!"
            notification.fireDate = NSDate().dateByAddingTimeInterval(1.0)
            
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            
        }
        
        println("Latitude: \(location.coordinate.latitude)")
        println("Longitude: \(location.coordinate.longitude)")
        
    }
    
}

