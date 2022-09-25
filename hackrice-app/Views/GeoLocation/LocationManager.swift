//
//  LocationManager.swift
//  hackrice-app
//
//  Created by Kayden Brewer on 9/24/22.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation? //Optional because we don't initially have userLocation
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation(){
        manager.requestWhenInUseAuthorization()
    }
}
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        switch status {
            
        case .notDetermined:
            print("DEBUG: Not determined")
        case .denied:
            print("DEBUG: denied")
        case .restricted:
            print("DEBUG: Not determined2")
        case .authorizedAlways:
            print("DEBUG: denied")
        case .authorizedWhenInUse:
            print("DEG: ahhhh")
        @unknown default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.userLocation = location
    }
}
