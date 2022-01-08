//
//  DoeasyViewModel.swift
//  Doesy
//
//  Created by Fatih Sağlam on 28.10.2021.
//

import SwiftUI
import RealmSwift

class DoeasyViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    @Published var selectedCategory: Category?
    
    init() {
        if !categories.isEmpty {
            self.selectedCategory = categories.first!
        }
    }
    
    func updateSelectedCategory(_ newCategory: Category) {
        selectedCategory = newCategory
    }
    
    func loadTasks() {}
    
    func loadCategories() {}
    
    func updateTask(category: Category, _ id: UUID) {
        for index in category.tasks.indices {
            if category.tasks[index].id == id {
                category.tasks[index].done.toggle()
            }
        }
    }
    
    func deleteTask(category: Category, _ indexSet: IndexSet) {
        category.tasks.remove(atOffsets: indexSet)
    }
    
    func timeForRow(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:MM a"
        return formatter.string(from: time)
    }
    
    func addNewTask(category: Category, _ task: Task) {
        category.tasks.append(task)
    }
    
    func addNewCategory(_ category: Category) {
        categories.append(category)
    }
}
