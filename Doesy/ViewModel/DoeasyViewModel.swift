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
        loadTasks()
    }
    
    func loadTasks() {
        tasks.append(contentsOf: [
            Task(title: "Meeting with team", color: "1B74EC"),
            Task(title: "Drink some coffee", done: true, color: "1B74EC"),
            Task(title: "Create new 3D drawing for new cients", color: "1B74EC"),
            Task(title: "Go to grocery and buy some milk", color: "1B74EC")
        ]
        )
    }
    
    func loadCategories() {
        categories.append(contentsOf: [
            
        ]
        )
    }
    
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
}
