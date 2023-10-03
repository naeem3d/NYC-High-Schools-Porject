//
//  WebService.swift
//  Test
//
//  Created by naeem alabboodi on 10/2/23.
//

import Foundation

protocol Service {
    func getHighSchoolList(url: URL) async throws -> [HighSchoolModel]
   
}

final class WebService : Service{
    
    func getHighSchoolList(url: URL) async -> [HighSchoolModel] {

        do {
        let (data, _)  =  try await URLSession.shared.data(from: url)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let newList = try jsonDecoder.decode([HighSchoolModel].self, from: data)
            return newList
        } catch {
            return []
        }
    }
    func getDetails(url: URL) async -> [DetailsHighSchoolModel] {
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let newList = try decoder.decode([DetailsHighSchoolModel].self, from: data)
            return newList
        }catch {
            return []
        }
    }
}
