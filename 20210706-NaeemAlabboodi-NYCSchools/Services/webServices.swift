//
//  webServices.swift
//  20230706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/23.
//

import Foundation

protocol Service {
    func getHighSchoolList(url: URL , completion: @escaping ([HighSchoolModel]?) -> ())
}
class Webservice:Service {
    
    func getHighSchoolList(url: URL , completion: @escaping ([HighSchoolModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(nil)
            } else if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let listHishschool =   try? decoder.decode([HighSchoolModel].self, from: data)
                
                if listHishschool != nil {
                    completion(listHishschool)
                }
                
            }
        }.resume()
    }
    
    
    
    func getDetailsHighSchool(url: URL , completion: @escaping ([DetailsHighSchoolModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil)
            } else if let data = data {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let listHishschool =   try? decoder.decode([DetailsHighSchoolModel].self, from: data)
                
                if listHishschool != nil {
                    completion(listHishschool)
                }
                
            }
        }.resume()
    }
    
    
    
}
