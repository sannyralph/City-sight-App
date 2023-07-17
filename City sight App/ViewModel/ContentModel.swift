//
//  ContentModel.swift
//  City sight App
//
//  Created by SANNI ABDULRAFIU on 22/06/2023.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject  {
    
    var  locationManager  = CLLocationManager()
    
    override init () {
        
        super.init()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
//        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if  locationManager.authorizationStatus ==  .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse {
            
            
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        if  userLocation  != nil {
            
            locationManager.stopUpdatingLocation()
            
            getBusinesses(category: "restaurants", location: userLocation!)
        }
        
      
    
    }
    func getBusinesses(category:String,  location:CLLocation){
        
//        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
//
//        let url =  URL(string: urlString)
        
        var urlComponents  = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6"),
        ]
        
        let url  = urlComponents?.url
        
        if let url = url {
            
            var request  = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer S2dqCpifg4SyacdK2zQC58zMvPOMl1IZPtNGbviaBGDAC2v01coBFB7bPROVyp0AXMUWAeEuDh8EiFsK02klO7L_-hz_ndckK8pN2-AOfDXu69y23GorsjTGeu6UZHYx", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let dataTAsk = session.dataTask(with: request) { (data, response , error) in
                
                
                if error == nil {
                    
                    print(response as Any)
                }
            }
            
            dataTAsk.resume()
                
                
            }
        }
    }

