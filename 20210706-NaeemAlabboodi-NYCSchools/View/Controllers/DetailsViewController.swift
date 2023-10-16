//
//  DetailsViewController.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/7/21.
//

import UIKit


protocol PresentHighSchoolDetails:AnyObject {
    func refreshUI(safedetils:DetailsHighSchoolModel)
}

class DetailsViewController: UIViewController, PresentHighSchoolDetails {
    
    var viewModel: DetailsViewModel!
    
    @IBOutlet weak var MathAvgScorLabel: UILabel?
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var TestingNumberlabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    var labelmath = ""
    var dbn2 : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DetailsViewModel(delegate: self)
        viewModel.fetchDetailsHS(dbn:dbn2)
        MathAvgScorLabel?.text = labelmath
        view.backgroundColor = .systemGray6
     
    }
    
    @objc func dismssVc(){
        dismiss(animated: true)
    }
    
    func refreshUI(safedetils:DetailsHighSchoolModel) {
        self.title = safedetils.schoolName
        self.MathAvgScorLabel?.text =   safedetils.numOfSatTestTakers
        self.writingScoreLabel?.text =  safedetils.satCriticalReadingAvgScore
        self.readingScoreLabel?.text =   safedetils.satMathAvgScore
        self.TestingNumberlabel?.text =  safedetils.satWritingAvgScore
       
        self.schoolNameLabel.text = safedetils.schoolName
    }
}
