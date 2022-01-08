//
//  DoeasyViewModel.swift
//  Doesy
//
//  Created by Fatih Sağlam on 28.10.2021.
//

import SwiftUI
import RealmSwift

class DoeasyViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    @Published var categories: [Category] = []
    
    init() {
        
    }
    
    func loadTasks() {}
    
    func loadCategories() {}
    
    func updateTask(_ id: UUID) {
        for index in tasks.indices {
            if tasks[index].id == id {
                tasks[index].done.toggle()
            }
        }
    }
    
    func deleteTask(_ indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func timeForRow(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:MM a"
        return formatter.string(from: time)
    }
    
    func addNewTask(_ task: Task) {
        tasks.append(task)
    }
    
    func addNewCategory(_ category: Category) {
        categories.append(category)
    }
}
