//
//  DoeasyViewModel.swift
//  Doesy
//
//  Created by Fatih Sağlam on 28.10.2021.
//

import SwiftUI

class DoeasyViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func loadTasks() {
        tasks.append(contentsOf: [Task(title: "Meeting with team", color: "AccentColorPink"),
                                  Task(title: "Drink some coffee", done: true, color: "AccentColorBlue"),
                                  Task(title: "Create new 3D drawing for new cients", color: "AccentColorBlue"),
                                  Task(title: "Go to grocery and buy some milk", color: "AccentColorPink")
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
    
    func timeForRow(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:MM a"
        return formatter.string(from: time)
    }
    
    func addNewTask(_ task: Task) {
        tasks.append(task)
    }
}
