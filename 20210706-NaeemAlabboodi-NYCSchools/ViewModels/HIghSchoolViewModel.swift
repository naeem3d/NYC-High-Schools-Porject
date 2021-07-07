//
//  HIghSchoolViewModel.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/21.
//

import Foundation

class ListHighSchoolViewModel  {
    var listHighSchool : [HighSchoolModel] = []
    
    var numberOfSection : Int {
        return 1
    }
    var delegete : PresentHighSchool?
    
    init(delegate : PresentHighSchool ){
        self.delegete = delegate
        
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        listHighSchool.count
    }
    
    func highSchoolAtIndex ( _ index:Int) -> HighSchoolViewModel {
        let highSchool = self.listHighSchool[index]
        return HighSchoolViewModel(highSchool)
    }
    
    func fetchHighScollList()  {
        
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        Webservice().getHighSchoolList(url: url) { [weak self] listHighschool2 in
            
            self?.listHighSchool = listHighschool2!
            self?.delegete?.refreashUi()
            
        }
        
        
    }
    
}




//MARK: - HighSchool struct

struct HighSchoolViewModel {
    
    private let highSchool : HighSchoolModel
    
    var HSName : String{
        return self.highSchool.schoolName
    }
    
    var totalStudent : String{
        return self.highSchool.totalStudents
    }
    
}

extension HighSchoolViewModel{
    
    init(_ highsSchool: HighSchoolModel){
        self.highSchool = highsSchool
    }
}
