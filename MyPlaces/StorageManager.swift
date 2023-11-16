//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Pavel on 03.11.2023.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Place){
        try! realm.write {
            realm.add(place)
        }
    }
}
