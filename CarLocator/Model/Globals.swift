//
//  Globals.swift
//  CarLocator
//
//  Created by Amr Al-Refae on 3/10/18.
//  Copyright © 2018 Amr Al-Refae. All rights reserved.
//

import Foundation
import RealmSwift

var realm: Realm!

var locations: Results<Location> {
    get {
        return realm.objects(Location.self)
    }
}
