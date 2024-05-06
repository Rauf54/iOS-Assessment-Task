//
//  listDetailPresenter.swift
//  Assessment iOS

//  Created by Rauf on 06/05/2024.
//

class listDetailPresenter: listDetailPresenterProtocol {
    
    weak var view: listDetailViewProtocol?
    var wireFrame: listDetailWireFrameProtocol?
    var post: ListDataModel?
    
    func viewDidLoad() {
        view?.showlistDetail(forPost: post!)
    }
    
}

