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
    var  highSchoolDetails : DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listHighSchoolViewModel = ListHighSchoolViewModel(delegate: self)
        setup()
        
    }
    
    
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = true
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
        if dtnHighSchool == nil {
            print("not found")
        } else { print(dtnHighSchool)}
        
        let detailsVC = DetailsViewController()
        let navControll = UINavigationController(rootViewController: detailsVC)
        present(navControll, animated: true) {
            
        }
        
       
    }
    
    
}
