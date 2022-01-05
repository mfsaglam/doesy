//
//  Category.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import Foundation
import RealmSwift

class Category: Object, Identifiable  {
    @objc dynamic var id = UUID()
    @objc dynamic var title: String = ""
    @objc dynamic var percentage: Double = 0
    @objc dynamic var color: String = ""
    @objc dynamic var tasks: [Task] = [Task]()
}
