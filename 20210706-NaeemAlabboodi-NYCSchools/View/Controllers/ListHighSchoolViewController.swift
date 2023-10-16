//
//  ListHighSchoolsNYS_TableTableViewController.swift
//  20210706-NaeemAlabboodi-NYCSchools
//
//  Created by naeem alabboodi on 7/6/21.
//

import UIKit

protocol PresentHighSchool:AnyObject {
    func refreashUi()
}

class ListHighSchoolViewController: UITableViewController {
    
    var  listHighSchoolViewModel : ListHighSchoolViewModel!
    
    var  highSchoolDetails : DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup(){
        listHighSchoolViewModel = ListHighSchoolViewModel(delegate: self)
        listHighSchoolViewModel.fetchHighScollList()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listHighSchoolViewModel.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HighSchoolTableViewCell  else {
            return UITableViewCell()
        }
        
        let highSchoolData = listHighSchoolViewModel.highSchoolAtIndex(indexPath.row)
        cell.NameLabel.text = highSchoolData.hsName
        cell.numberlabel.text = highSchoolData.totalStudent
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dtnHighSchool = listHighSchoolViewModel.getHighSchool(indexPath.row)
        
        let detailsVC = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController
        detailsVC?.dbn2 = dtnHighSchool.dbn
      
        
        navigationController?.pushViewController(detailsVC!, animated: true)
    }
}

extension ListHighSchoolViewController: PresentHighSchool {
    func refreashUi() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
