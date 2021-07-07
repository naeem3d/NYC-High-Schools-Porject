//
//  ListHighSchoolsNYS_TableTableViewController.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/21.
//

import UIKit

protocol PresentHighSchool {
    func refreashUi()
}



class ListHighSchoolViewController: UITableViewController , PresentHighSchool{
    func refreashUi() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    var  listHighSchoolViewModel : ListHighSchoolViewModel!
    var  highSchoolDetails : DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listHighSchoolViewModel = ListHighSchoolViewModel(delegate: self)
        setup()
        
    }
    
    
    private func setup(){
       
        listHighSchoolViewModel.fetchHighScollList()
        
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listHighSchoolViewModel.numberOfRowsInSection(1)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HighSchoolTableViewCell  else {
            fatalError("notFound Highschool")
        }
        
        let HighSchoolVM = listHighSchoolViewModel.listHighSchool[indexPath.row]
        cell.NameLabel.text = HighSchoolVM.schoolName
        cell.numberlabel.text = HighSchoolVM.totalStudents
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dtnHighSchool = listHighSchoolViewModel.listHighSchool[indexPath.row].dbn
        
        let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        detailsVC?.dbn2 = dtnHighSchool
      
        
        navigationController?.pushViewController(detailsVC!, animated: true)
        
        
        
        
        
    }
    
    
    
    
    
    
}
