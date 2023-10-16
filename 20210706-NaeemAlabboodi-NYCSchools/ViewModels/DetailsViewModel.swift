//
//  DetailsViewModel.swift
//  20230706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/7/23.
//

import Foundation

class DetailsViewModel {
    
    var HighSchoolDetails : DetailsHighSchoolModel!
    
    weak var delegete : PresentHighSchoolDetails?
    
    init(delegate : PresentHighSchoolDetails ){
        self.delegete = delegate
    }
    
    func fetchDetailsHS(dbn:String) {
        
        if  let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") {
          
            Webservice().getDetailsHighSchool(url: url) {  detailsHS in
                if detailsHS?.count == 0 {
//                    self.labelmath =  "Not Data there "
                    print("NO Data There ")
                
                } else if let safedetils = detailsHS?[0] {
                 
                    DispatchQueue.main.async {
                        self.delegete?.refreshUI(safedetils: safedetils)
                    }
                   
                } else {
                    print("No data ")
                }
                
               
                
            }
           
        }
        }
       
}



