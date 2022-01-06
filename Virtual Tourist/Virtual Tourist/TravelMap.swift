//
//  ViewController.swift
//  Virtual Tourist
//
//  Created by Jack McCabe on 1/4/22.
//

import UIKit
import MapKit

class TravelMap: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        map.delegate = self
        //map.MKMapViewDelegate = self
      //  mapView.delegate = self
        map.isScrollEnabled = true
       map.isZoomEnabled = true
       map.showsCompass = true
        map.showsTraffic = true
        
        tapToPin()
    }
    
    
    /*
func handleTap(sender: UILongPressGestureRecognizer){
            print("tap")
        }
     */
    
    func tapToPin(){
        var longTap = UILongPressGestureRecognizer(target: self, action: #selector(addPin))
        
        longTap.minimumPressDuration = 0.2
        longTap.delegate = self
        var xLoc = longTap.location(in: self.map)
        self.map.addGestureRecognizer(longTap)
    }
    
    @objc func addPin(_ fromTap: UILongPressGestureRecognizer){
        var cor = fromTap.location(in: self.map)
        var CLcor = self.map.convert(cor, toCoordinateFrom : self.map)
   
        let point = MKPointAnnotation()
        point.coordinate = CLcor
        point.subtitle = "Test Subtitle"
        self.map.addAnnotation(point)
        print("Printing Map Annotations")
        print(self.map.annotations[0].subtitle)
        
}
    
    
    //Map Delegate Methods
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .blue
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
          
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }

    
    // This delegate method is implemented to respond to taps. It opens the system browser
    // to the URL specified in the annotationViews subtitle property.
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView){
        print("this Method was tapped")
    }
    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView){
        print("didSelect worked")
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
     print("tapped")
        
        if control == view.rightCalloutAccessoryView {
            print("Tapped here")
            /*
            let app = UIApplication.shared
            //unwrapping the subtitle
            if let toOpen = view.annotation?.subtitle! {
                if let guardedURL =  NSURL(string: toOpen){
                    if (app.canOpenURL(guardedURL as URL)){
                            app.openURL(URL(string: toOpen)!)
                    }else {
                        print("URL was no valid")
                    }
                    
                }
                }
             */
    }
    }

}

