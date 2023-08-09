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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var resturants = [Business]()
    @Published var sights = [Business]()
    
    override init () {
        
        super.init()
        
        locationManager.delegate = self
        
       
//        locationManager.startUpdatingLocation()
    }
    
    func requestGeolocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        authorizationState = locationManager.authorizationStatus
        
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
            
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
        
      
    
    }
    func getBusinesses(category:String,  location:CLLocation){
        
        var urlComponents  = URLComponents(string: Constants.apiUrl)
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
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            let session = URLSession.shared
            
            let dataTAsk = session.dataTask(with: request) { (data, response , error) in
                
                
                if error == nil {
                
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        
                        var businesses = result.businesses
                        businesses.sort { b1, b2 in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        for b in businesses {
                            b.getImageData()
                        }
                        
                        
                        DispatchQueue.main.async {
                            if category == Constants.sightsKey {
                                self.sights = businesses
                            }
                            else if category == Constants.restaurantsKey {
                                self.resturants = businesses
                            }
                        }
                        
                    }
                    catch{
                        print(error)
                    }
                }
            }
            
            dataTAsk.resume()
                
                
            }
        }
    }

