//
//  DetailsViewModel.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/7/21.
//

import Foundation

class DetailsViewModel {
    var HighSchoolDetails : [DetailsHighSchoolModel] = []
    
    var delegete : PresentHighSchool?
    init(delegate : PresentHighSchool ){
        self.delegete = delegate
        
    }
    
    func detailsHighSchoolAtIndex(index:Int) -> DetailsHighSchoolModel{
        let detailsHighSchool = self.HighSchoolDetails[index]
        
        return detailsHighSchool
        
    }
    
    
    
    
    
    func fetchDetailsHS(){
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")!
        
        Webservice().getDetailsHighSchool(url: url) { detailsHS in
            self.HighSchoolDetails = detailsHS!
        }
        }
        
    }
    
    

