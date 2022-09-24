//
//  HomePageViewModl.swift
//  hackrice-app
//
//  Created by Aidan Terlizzi on 9/24/22.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var doorOpened: Bool = false
    
    @MainActor
    func openNearestDoor(coordinates: [Double]) {
        guard let url = URL(string: "http://localhost:3000/door/open") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "coordinates": coordinates]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        self.isLoading = true
        self.doorOpened = false
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(OpenDoorResponse.self, from: data) {
                    if decodedData.status == "success" {
                        self.isLoading = false
                        self.doorOpened = true
                    }
                }
            }
        }
        task.resume()
    }
}
