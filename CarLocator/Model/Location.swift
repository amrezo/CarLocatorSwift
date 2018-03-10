//
//  Location.swift
//  CarLocator
//
//  Created by Amr Al-Refae on 3/10/18.
//  Copyright © 2018 Amr Al-Refae. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    
    @objc dynamic var latitude: Double = 0
    @objc dynamic var longitude: Double = 0
    @objc dynamic var title: String = ""
    
}
