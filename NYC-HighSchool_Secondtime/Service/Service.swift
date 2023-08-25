//
//  Service.swift
//  NYC-HighSchool_Secondtime
//
//  Created by naeem alabboodi on 8/25/23.
//

import Foundation
// https://data.cityofnewyork.us/resource/f9bf-2cp4.json

enum APIServiceError: Error {
    case invalidURL
    case serverError(Error)
    case decoddingError(Error)
}


class APIServces {
    let baseURLString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    func fetchSchools()  async throws  -> [School] {
        guard let url = URL(string: baseURLString) else { throw APIServiceError.invalidURL}
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let schools = try JSONDecoder().decode([School].self, from: data)
            return schools
        } catch {
            if error is DecodingError {
                throw APIServiceError.decoddingError(error)
            } else {
                throw APIServiceError.serverError(error)
            }
        }
    }
}
