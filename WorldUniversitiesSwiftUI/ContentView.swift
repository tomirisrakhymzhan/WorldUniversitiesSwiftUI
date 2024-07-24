//
//  ContentView.swift
//  WorldUniversitiesSwiftUI
//
//  Created by Томирис Рахымжан on 23/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var getUniversities = GetUniversities()
    
    var body: some View {
        NavigationStack {
            List(getUniversities.universities) { university in
                UniversityRowView(universityItem: university)
            }.refreshable {
                self.getUniversities.getUniversities()
            }
            .navigationTitle("World Universities")
        }
    }
}

class GetUniversities : ObservableObject {
    @Published var universities = [University]()
    
    init(){
        getUniversities()
    }
    
    func getUniversities() {
        // Define the URL for the request
        let urlString = "http://demo5037315.mockable.io/getUniversities"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // Handle any errors
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // Check if we received data
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Try to decode the JSON data
            do {
                let universitiesResponse = try JSONDecoder().decode(UniversitiesResponse.self, from: data)
                
                
                DispatchQueue.main.async {
                    self.universities = universitiesResponse.universities
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        // Start the task
        task.resume()
    }
}

#Preview {
    ContentView()
}
