//
//  listDetailProtocols.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import UIKit

protocol listDetailViewProtocol: class {
    var presenter: listDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showlistDetail(forPost post: ListDataModel)
}

protocol listDetailWireFrameProtocol: class {
    static func createlistDetailModule(forPost post: ListDataModel) -> UIViewController
}

protocol listDetailPresenterProtocol: class {
    var view: listDetailViewProtocol? { get set }
    var wireFrame: listDetailWireFrameProtocol? { get set }
    var post: ListDataModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
