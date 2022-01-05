//
//  DoeasyViewModel.swift
//  Doesy
//
//  Created by Fatih Sağlam on 28.10.2021.
//

import SwiftUI
import RealmSwift

class DoeasyViewModel: ObservableObject {
    
    @Published var tasks: [Task<Color>] = []
    @Published var categories: [Category<Color>] = []
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        tasks.append(contentsOf: [
            Task(title: "Meeting with team", color: Color("AccentColorBlue")),
            Task(title: "Drink some coffee", done: true, color: Color("AccentColorBlue")),
            Task(title: "Create new 3D drawing for new cients", color: Color("AccentColorBlue")),
            Task(title: "Go to grocery and buy some milk", color: Color("AccentColorPink"))
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
    
    func addNewTask(_ task: Task<Color>) {
        tasks.append(task)
    }
}
