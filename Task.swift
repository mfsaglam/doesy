//
//  Task.swift
//  Doesy
//
//  Created by Fatih Sağlam on 28.10.2021.
//

import Foundation

struct Task<TaskColor>: Identifiable {
    var id = UUID()
    var title: String
    var done: Bool = false
    var color: TaskColor
    var time: Date = Date.now
}
