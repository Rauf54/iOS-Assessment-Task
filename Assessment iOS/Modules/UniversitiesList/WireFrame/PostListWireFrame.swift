//
//  UniversityListWireFrame.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import UIKit

class UniversityListWireFrame: UniversityListWireFrameProtocol {
    
    class func createUniversityListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "listNavigationController")
        if let view = navController.childViewControllers.first as? UniversitiesListView {
            let presenter: UniversityListPresenterProtocol & UniversityListInteractorOutputProtocol = UniversityListPresenter()
            let interactor: UniversityListInteractorInputProtocol & UniversityListRemoteDataManagerOutputProtocol = UniversityListInteractor()
            let localDataManager: UniversityListLocalDataManagerInputProtocol = UniversityListLocalDataManager()
            let remoteDataManager: UniversityListRemoteDataManagerInputProtocol = NetworkManager()
            let wireFrame: UniversityListWireFrameProtocol = UniversityListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    

    func presentlistDetailScreen(from view: UniversityListViewProtocol, forPost post: ListDataModel) {
        let listDetailViewController = listDetailWireFrame.createlistDetailModule(forPost: post)
   
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(listDetailViewController, animated: true)
        }
    }
    
}
