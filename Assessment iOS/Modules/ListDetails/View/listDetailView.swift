//
//  listDetailView.swift
//  Assessment iOS
//
//
//  Created by Rauf on 06/05/2024.
//


import UIKit

class listDetailView: UIViewController {
    
    
    @IBOutlet weak var universityNameLbl: UILabel!
    @IBOutlet weak var universityStateLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var codeLbl: UILabel!
    @IBOutlet weak var webPageLbl: UILabel!
    
    var presenter: listDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension listDetailView: listDetailViewProtocol {
    func showlistDetail(forPost post: ListDataModel) {
        universityNameLbl?.text = post.name
        universityStateLbl.text = post.stateProvince
        countryLbl.text = post.country
        webPageLbl.text = post.webPages?.first
        codeLbl.text = post.alphaTwoCode
    }
    
}
