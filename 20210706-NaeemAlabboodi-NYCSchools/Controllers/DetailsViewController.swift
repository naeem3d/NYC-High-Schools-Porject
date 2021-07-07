//
//  DetailsViewController.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/7/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var HighSchoolDetails: DetailsViewModel?
    
    @IBOutlet weak var MathAvgScorLabel: UILabel?
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var TestingNumberlabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    var labelmath = ""
    var dbn2 : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetailsHS(dbn:dbn2)
        
        MathAvgScorLabel?.text = labelmath
        
        
        view.backgroundColor = .systemGray6
     
    }
    
    @objc func dismssVc(){
        dismiss(animated: true)
    }
    
    func fetchDetailsHS(dbn:String) {
        
        
        if  let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)"){
          
            Webservice().getDetailsHighSchool(url: url) {  detailsHS in
                if detailsHS?.count == 0 {
                    self.labelmath =  "Not Data there "
                    print("NO Data There ")
                
                } else if let safedetils = detailsHS?[0] {
                 
                    DispatchQueue.main.async {
                        self.title = safedetils.schoolName
                        self.MathAvgScorLabel?.text =   safedetils.numOfSatTestTakers
                        self.writingScoreLabel?.text =  safedetils.satCriticalReadingAvgScore
                        self.readingScoreLabel?.text =   safedetils.satMathAvgScore
                        self.TestingNumberlabel?.text =  safedetils.satWritingAvgScore
                       
                        self.schoolNameLabel.text = safedetils.schoolName
                        self.HighSchoolDetails?.HighSchoolDetails = safedetils
                    }
                   
                } else {
                    print("No data ")
                }
                
               
                
            }
           
        }
        }
       
   
    
    
}
