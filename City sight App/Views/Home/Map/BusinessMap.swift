//
//  BusinessMap.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 03/08/2023.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    @Binding var selectedBusiness: Business?
    
    var locations:[MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        for business in model.resturants  + model.sights  {
            
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                
                let a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
            
           
        }
          return annotations
    }
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        mapView.showsUserLocation  = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        
        uiView.addAnnotations(self.locations)
        uiView.showAnnotations(self.locations, animated: true)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    class Coordinator: NSObject, MKMapViewDelegate  {
        
        var map: BusinessMap
        
        init(map: BusinessMap) {
            
            self.map  = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if annotation is MKUserLocation {
                return nil
                
            }
            
            var annotationView =  mapView.dequeueReusableAnnotationView(withIdentifier: Constants.annotationReuseId)
            
            if annotationView == nil {
                
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.annotationReuseId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type:  .detailDisclosure)
                
            }
            else {
                annotationView!.annotation = annotation
            }
            
            return annotationView
            
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            for business in map.model.resturants + map.model.sights {
                
                if business.name == view.annotation?.title {
                    
                    map.selectedBusiness = business
                    
                    return
                }
            }
            
            view.annotation?.title
        }
        
    }
}
