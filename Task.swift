//
//  Task.swift
//  Doesy
//
//  Created by Fatih Sağlam on 28.10.2021.
//

import Foundation
import RealmSwift

class Task: Object, Identifiable {
    var id = UUID()
    var title: String = ""
    var done: Bool = false
    var color: String = ""
    var time: Date = Date.now
}
