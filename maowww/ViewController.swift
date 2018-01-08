//
//  ViewController.swift
//  maowww
//
//  Created by sameh mohammed on 1/8/18.
//  Copyright © 2018 com.najeeb. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation
class ViewController: UIViewController , MKMapViewDelegate,CLLocationManagerDelegate{

      var myLocationManager = CLLocationManager()
    
    @IBOutlet weak var mymap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mymap.delegate = self;
        
        
        
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        
        myLocationManager.delegate=self
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if (authorizationStatus == CLAuthorizationStatus.notDetermined) || (authorizationStatus == nil)
        {
            myLocationManager.requestWhenInUseAuthorization()
            
            
            
            print("get in lo updates")
        }
        else
        {
            myLocationManager.startUpdatingLocation()
            
            print("get out updates")
        }
        
        
        
        let blueLocation = CLLocationCoordinate2D(latitude:30.45454554, longitude: 29.646727)
        
        let blueAnnotation = MyAnnotation(coordinate: blueLocation, title:"ghghhg",subtitle: "hgnhhghghg",pinColor: .Green ,uid:"hghg",type:"provider")
        
        self.mymap.addAnnotation(blueAnnotation)
        
        
        self.mymap.showAnnotations(self.mymap.annotations, animated: true)
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation:CLLocation = locations.last! as CLLocation
        
        print("LatitudeMain =\( newLocation.coordinate.latitude)")
        print("LongitudeMain =\( newLocation.coordinate.longitude)")
        
        
    
        
        
        
    }
    
  
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
    
            if annotation is MyAnnotation == false
            {
                
                return nil
            }
            
            
            let senderAnnotation = annotation as! MyAnnotation
            
            let pinReusableIdentifier = senderAnnotation.pinColor.rawValue
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pinReusableIdentifier)
            
            if annotationView == nil
            {
                
                annotationView = MKAnnotationView(annotation: senderAnnotation,                                                                                                reuseIdentifier: pinReusableIdentifier)
                annotationView!.canShowCallout = false
                
                
                
            }
            
            print("avxasgydvxjsakv")
            
            if senderAnnotation.pinColor == PinColor.Green
            {
                
                    let pinImage = UIImage(named:"directMarker3.png")
                    
                    annotationView!.image = pinImage
                    
                    
              
                    
                
                
                
            }
      
        
          return annotationView
        
    }
    
    
   
     @objc func pressButton(_ sender: UIButton) {
        print("testy")
    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        

        let customView = (Bundle.main.loadNibNamed("customDes", owner: self, options: nil))?[0] as! customDesOut;
        
        var calloutViewFrame = customView.frame;
        calloutViewFrame.origin = CGPoint(x:calloutViewFrame.size.width/2 ,y: calloutViewFrame.size.height);
        customView.frame = calloutViewFrame;
        
        customView.btn.setTitle("djhhdshgsdhdhsggh", for: .normal)
        
        customView.btn.addTarget(self, action: #selector(self.pressButton(_:)), for: .touchUpInside)
        
       
        view.addSubview(customView)
        
        
        
        for v in view.subviews
        {
            if v is customDesOut
            {
                continue
            }
            else
            {
                view.insertSubview(customView, aboveSubview: v)
            }
        }
        
    }
    
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView)
    {
        
      
        for v in view.subviews
        {
            if v is customDesOut
            {
               v.removeFromSuperview()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

