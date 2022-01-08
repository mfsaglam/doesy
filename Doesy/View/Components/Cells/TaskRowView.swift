//
//  TaskRowView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: Task
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: task.done ? "checkmark.circle" : "circle")
                .foregroundColor(task.done ? Color.secondary : Color(hex: task.color))
                .font(.title)
            VStack(alignment: .leading) {
                Text(task.title)
                    .strikethrough(task.done ? true : false)
                    .foregroundColor(task.done ? .secondary : .primary)
                    .bold()
                    .opacity(0.7)
                Text("\(task.time)")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
        .padding(.vertical, 3)
        .background(Color("Cell"))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

//struct TaskRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskRowView()
//            .preferredColorScheme(.dark)
//    }
//}
