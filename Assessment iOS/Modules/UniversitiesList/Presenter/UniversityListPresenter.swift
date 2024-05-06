//
//  UniversityListPresenter.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//


class UniversityListPresenter: UniversityListPresenterProtocol {
    weak var view: UniversityListViewProtocol?
    var interactor: UniversityListInteractorInputProtocol?
    var wireFrame: UniversityListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveList()
    }
    
    func showListDetail(forList list: ListDataModel) {
        wireFrame?.presentlistDetailScreen(from: view!, forPost: list)
    }

}

extension UniversityListPresenter: UniversityListInteractorOutputProtocol {
    
    func didRetrievelist(_ list: [ListDataModel]) {
        view?.hideLoading()
        view?.showList(with: list)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}


