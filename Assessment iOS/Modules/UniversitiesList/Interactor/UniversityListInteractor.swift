//
//  UniversityListInteractor.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//


class UniversityListInteractor: UniversityListInteractorInputProtocol {
    weak var presenter: UniversityListInteractorOutputProtocol?
    var localDatamanager: UniversityListLocalDataManagerInputProtocol?
    var remoteDatamanager: UniversityListRemoteDataManagerInputProtocol?
    
    func retrieveList() {
        do {
            if let UniversityList = try localDatamanager?.retrieveList() {
                let postModelList = UniversityList.map() {
                    return ListDataModel(stateProvince: $0.stateProvince, webPages: $0.webPages, name: $0.name, alphaTwoCode: $0.alphaTwoCode, country: $0.country)
                }
                if  postModelList.isEmpty {
                    remoteDatamanager?.retrieveList()
                }else{
                   presenter?.didRetrievelist(postModelList)
                }
            } else {
                remoteDatamanager?.retrieveList()
            }
            
        } catch {
            presenter?.didRetrievelist([])
        }
    }
        
}

extension UniversityListInteractor: UniversityListRemoteDataManagerOutputProtocol {
    
    func onListsRetrieved(_ list: [ListDataModel]) {
        presenter?.didRetrievelist(list)
        
        for listModel in list {
            do {
                try localDatamanager?.saveList(stateProvince: listModel.stateProvince ?? "", name: listModel.name ?? "", alphaTwoCode: listModel.alphaTwoCode ?? "", country: listModel.country ?? "", webPages: listModel.webPages ?? [])
            } catch  {
                
            }
        }
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
