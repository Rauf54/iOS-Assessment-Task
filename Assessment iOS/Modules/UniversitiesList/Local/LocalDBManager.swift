//
//  LocalDBManager.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import CoreData

class UniversityListLocalDataManager:UniversityListLocalDataManagerInputProtocol {
    
    func retrieveList() throws -> [UniversityList]  {
        
        guard let managedOC = LocalDBManager.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<UniversityList> = NSFetchRequest(entityName: String(describing: UniversityList.self))
        
        return try managedOC.fetch(request)
    }
    
    func saveList(stateProvince: String, name: String, alphaTwoCode: String, country: String, webPages: [String]) throws {
        guard let managedOC = LocalDBManager.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPost = NSEntityDescription.entity(forEntityName: "UniversityList",
                                                           in: managedOC) {
            let list = UniversityList(entity: newPost, insertInto: managedOC)
            list.alphaTwoCode = alphaTwoCode
            list.country = country
            list.name = name
            list.stateProvince = stateProvince
            list.webPages = webPages
            try managedOC.save()
        }
        throw PersistenceError.couldNotSaveObject
    
    }
    
}
