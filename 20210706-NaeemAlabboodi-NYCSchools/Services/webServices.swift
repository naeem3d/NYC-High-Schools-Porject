//
//  webServices.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/21.
//

import Foundation

class Webservice{
    
    
    func getHighSchoolList(url: URL , completion: @escaping ([HighSchoolModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
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
    
    
    
    func getDetailsHighSchool(url: URL , completion: @escaping ([DetailsHighSchoolModel]?) -> ()){
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
