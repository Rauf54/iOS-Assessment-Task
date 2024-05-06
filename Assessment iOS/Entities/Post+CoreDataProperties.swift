//
//  Post+CoreDataProperties.swift
//  
//
//  Created by Rauf on 06/05/2024.
//

import Foundation
import CoreData


extension UniversityList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UniversityList> {
        return NSFetchRequest<UniversityList>(entityName: "UniversityList");
    }

    @NSManaged public var stateProvince: String?
    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var webPages: [String]?
    @NSManaged public var alphaTwoCode: String?

}
