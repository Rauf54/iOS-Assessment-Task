//
//  UniversitiesListView.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import UIKit
import ProgressHUD

class UniversitiesListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: UniversityListPresenterProtocol?
    var universitiesList: [ListDataModel] = []
    var dataRefresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.addSubview(dataRefresh)

        // Configure refresh control
        dataRefresh.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    @objc func refreshData(_ sender: Any) {
            // Implement your refresh logic here
            // For example, fetch new data from a server
        fetchUpdatedData()
        }
    
    func fetchUpdatedData() {
           // Placeholder function for fetching data
           // Replace this with your actual data fetching logic
           DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
               // End refreshing
               self.dataRefresh.endRefreshing()
               // Reload table view data
               self.tableView.reloadData()
           }
       }
    
}
//MARK: - Extension
extension UniversitiesListView: UniversityListViewProtocol {
    
    func showList(with list: [ListDataModel]) {
        universitiesList = list
        tableView.reloadData()
    }
    
    func showError() {
      print("Error")
    }
    
    func showLoading() {
        ProgressHUD.show()
    }
    
    func hideLoading() {
        ProgressHUD.dismiss()
    }
    
}
//MARK: - TableView Datasource and Delegate
extension UniversitiesListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        
        let list = universitiesList[indexPath.row]
        cell.setValue(forList: list)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universitiesList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("pos \(universitiesList[indexPath.row])")
        presenter?.showListDetail(forList: universitiesList[indexPath.row])
    }
    
}
