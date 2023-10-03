//
//  DetailsHighSchoolModel.swift
//  20230706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/23.
//

import Foundation

struct DetailsHighSchoolModel: Decodable {
    let dbn :String
    let schoolName:String
    let numOfSatTestTakers:String
    let satCriticalReadingAvgScore:String
    let satMathAvgScore:String
    let satWritingAvgScore:String
    
}
