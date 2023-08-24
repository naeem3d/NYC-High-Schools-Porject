//
//  Service.swift
//  NYC_HighSchools
//
//  Created by naeem alabboodi on 8/24/23.
//

import Foundation
// at this file I will Handle the fetching of data from the API.


enum APIServiceError: Error {
    case invalidURL
    case serverError(Error)
    case decodingError(Error)
}

class APIService {
    let baseURLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"

    func fetchSchools() async throws -> [School] {
        guard let url = URL(string: baseURLString) else {
            throw APIServiceError.invalidURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let schools = try JSONDecoder().decode([School].self, from: data)
            return schools
        } catch {
            if error is DecodingError {
                throw APIServiceError.decodingError(error)
            } else {
                throw APIServiceError.serverError(error)
            }
        }
    }
}
