//
//  HighSchoolViewModel.swift
//  Test
//
//  Created by naeem alabboodi on 10/2/23.
//

import Foundation
class HighSchoolViewModel: ObservableObject {
    @Published var highSchoolList : [HighSchoolModel] = []
    var service: Service // Use the Service protocol here
    init(webService: Service) {
        
        self.service = webService
    }
    @MainActor
    func loadData() async {
        guard let url = URL(string: EndPoints.baseUrl) else {return}
        do{
            highSchoolList = try await service.getHighSchoolList(url: url)
        }catch{
            
        }
    }
    
}
