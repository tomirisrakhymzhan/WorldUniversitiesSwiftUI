//
//  UniversityRowView.swift
//  WorldUniversitiesSwiftUI
//
//  Created by Томирис Рахымжан on 23/07/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct UniversityRowView: View {
    let universityItem: University
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            WebImage(url: URL(string: universityItem.pictureURL ?? "")!)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 3)
                )
                .shadow(radius: 7)
                
            VStack(alignment: .leading, spacing: 8) {
                Text(universityItem.name ?? "Unknown University")
                    .font(.headline)
                
                HStack {
                    WebImage(url: URL(string: universityItem.location?.countryImage ?? "")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        

                    Text("\(universityItem.location?.city ?? "Unknown City"), \(universityItem.location?.state ?? "Unknown State"), \(universityItem.location?.country ?? "Unknown Country")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                LabelView(text: "World rank: \(universityItem.ranking ?? 0)", textColor: .white, color: .indigo)
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
    }
}

#Preview {
    UniversityRowView(universityItem: University(
        name: "Harvard University",
        ranking: 1,
        location: Location(
            city: "Cambridge",
            state: "Massachusetts",
            country: "USA",
            countryImage: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg"
        ),
        establishedYear: 1636,
        type: .typePrivate,
        coursesOffered: ["Computer Science", "Law", "Medicine", "Business"],
        contactDetails: ContactDetails(
            phone: "+1 617-495-1000",
            email: "contact@harvard.edu",
            website: "https://www.harvard.edu"
        ),
        pictureURL: "https://lh3.googleusercontent.com/p/AF1QipMfiDHqDC-JO5vrljoS65-CIXYDUijRU8xrgQcC=s1360-w1360-h1020"
    ))
}
