//
//  listDetailWireFrame.swift
//  Assessment iOS
//
//
//  Created by Rauf on 06/05/2024.
//

import UIKit

class listDetailWireFrame: listDetailWireFrameProtocol {
    
    class func createlistDetailModule(forPost post: ListDataModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "listDetailController")
        if let view = viewController as? listDetailView {
            let presenter: listDetailPresenterProtocol = listDetailPresenter()
            let wireFrame: listDetailWireFrameProtocol = listDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.post = post
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}


