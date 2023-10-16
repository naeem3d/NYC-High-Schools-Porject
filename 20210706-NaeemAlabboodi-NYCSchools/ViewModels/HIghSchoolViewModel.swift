//
//  HIghSchoolViewModel.swift
//  20230706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/23.
//

import Foundation

class ListHighSchoolViewModel  {
    
    private var listHighSchool : [HighSchoolModel] = []
    
    weak var delegete : PresentHighSchool?
    var service:Service?
    
    init(delegate : PresentHighSchool, service:Service = Webservice()){
        self.delegete = delegate
        self.service = service
        
    }
    
    var numberOfItems:Int {
        return listHighSchool.count
    }

    func highSchoolAtIndex( _ index:Int) -> HighSchoolData {
        let highSchool = self.listHighSchool[index]
        return HighSchoolData(highSchool)
    }
    
    func getHighSchool( _ index:Int) -> HighSchoolModel {
        return self.listHighSchool[index]
    }
    
    
    func fetchHighScollList() {
        guard let url = URL(string: EndPoints.baseUrl) else { return }
         service?.getHighSchoolList(url: url) { [weak self] listHighschool2 in
            self?.listHighSchool = listHighschool2!
            self?.delegete?.refreashUi()
        }
    }
    
}



//MARK: - HighSchool struct

struct HighSchoolData {
    
    private let highSchool : HighSchoolModel
    
    var hsName : String{
        return self.highSchool.schoolName
    }
    
    var totalStudent : String{
        return self.highSchool.totalStudents
    }
    
}

extension HighSchoolData {
    
    init(_ highsSchool: HighSchoolModel){
        self.highSchool = highsSchool
    }
}
