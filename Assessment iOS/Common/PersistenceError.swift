//
//  PersistenceError.swift
//  Assessment iOS
//
//  Created by Rauf on 06/05/2024.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
