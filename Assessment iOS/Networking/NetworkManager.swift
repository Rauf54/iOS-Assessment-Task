//
//  NetworkManager.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NetworkManager:UniversityListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: UniversityListRemoteDataManagerOutputProtocol?
    
    func retrieveList() {
        Alamofire
            .request("http://universities.hipolabs.com/search?country=United%20Arab%20Emirates", method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[ListDataModel]>) in
                switch response.result {
                case .success(let list):
                    self.remoteRequestHandler?.onListsRetrieved(list)
            
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
