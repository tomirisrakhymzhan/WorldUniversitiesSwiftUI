//
//  University.swift
//  WorldUniversitiesSwiftUI
//
//  Created by Томирис Рахымжан on 23/07/2024.
//

import Foundation

struct UniversitiesResponse: Codable {
    let universities: [University]
}

// MARK: - University
struct University: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String?
    let ranking: Int?
    let location: Location?
    let establishedYear: Int?
    let type: TypeEnum?
    let coursesOffered: [String]?
    let contactDetails: ContactDetails?
    let pictureURL: String?

    enum CodingKeys: String, CodingKey {
        case name, ranking, location
        case establishedYear = "established_year"
        case type
        case coursesOffered = "courses_offered"
        case contactDetails = "contact_details"
        case pictureURL = "picture_url"
    }
}

// MARK: - ContactDetails
struct ContactDetails: Codable {
    let phone, email: String?
    let website: String?
}

// MARK: - Location
struct Location: Codable {
    let city, state, country: String?
    let countryImage: String?

    enum CodingKeys: String, CodingKey {
        case city, state, country
        case countryImage = "country_image"
    }
}

enum TypeEnum: String, Codable {
    case typePrivate = "Private"
    case typePublic = "Public"
}
