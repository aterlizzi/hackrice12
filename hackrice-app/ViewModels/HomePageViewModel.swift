//
//  HomePageViewModl.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/24/22.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var doorOpened: DoorStatus = .unopened
    
    @MainActor
    func openNearestDoor(coordinates: [Double], email: String) {
        guard let url = URL(string: "http://localhost:3000/door/open") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "coordinates": coordinates,
            "email": email
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        self.isLoading = true
        self.doorOpened = .unopened
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(OpenDoorResponse.self, from: data) {
                    DispatchQueue.main.async {
                        if decodedData.status == "success" {
                            self.isLoading = false
                            self.doorOpened = .open
                            self.resetDoorStatus()
                        } else if decodedData.status == "noPermission" {
                            self.doorOpened = .noPermission
                            self.resetDoorStatus()
                            self.isLoading = false
                        }
                        else {
                            self.doorOpened = .failed
                            self.resetDoorStatus()
                            self.isLoading = false
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
    func resetDoorStatus(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.doorOpened = .unopened
        }
    }
}

enum DoorStatus {
    case open
    case failed
    case unopened
    case noPermission
}
