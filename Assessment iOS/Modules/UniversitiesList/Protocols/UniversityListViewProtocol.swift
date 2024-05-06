//
//  UniversityListProtocols.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//


import UIKit

protocol UniversityListViewProtocol: class {
    var presenter: UniversityListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showList(with list: [ListDataModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol UniversityListWireFrameProtocol: class {
    static func createUniversityListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentlistDetailScreen(from view: UniversityListViewProtocol, forPost post: ListDataModel)
}

protocol UniversityListPresenterProtocol: class {
    var view: UniversityListViewProtocol? { get set }
    var interactor: UniversityListInteractorInputProtocol? { get set }
    var wireFrame: UniversityListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showListDetail(forList list: ListDataModel)
}

protocol UniversityListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrievelist(_ list: [ListDataModel])
    func onError()
}

protocol UniversityListInteractorInputProtocol: class {
    var presenter: UniversityListInteractorOutputProtocol? { get set }
    var localDatamanager: UniversityListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: UniversityListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveList()
}

protocol UniversityListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol UniversityListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: UniversityListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveList()
}

protocol UniversityListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onListsRetrieved(_ list: [ListDataModel])
    func onError()
}

protocol UniversityListLocalDataManagerInputProtocol: class {
     // INTERACTOR -> LOCALDATAMANAGER
    func retrieveList() throws -> [UniversityList]
    func saveList(stateProvince: String, name: String, alphaTwoCode: String, country: String, webPages: [String]) throws
}
