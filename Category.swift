//
//  Category.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import Foundation

struct Category<CategoryColor>: Identifiable {
    var id = UUID()
    var title: String
    var percentage: Double = 0
    var color: CategoryColor
}
