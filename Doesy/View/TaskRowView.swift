//
//  TaskRowView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import SwiftUI

struct TaskRowView: View {
    var label: String
    var done: Bool
    var color: Color
    var hour: String
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: done ? "checkmark.circle" : "circle")
                .foregroundColor(done ? Color.secondary : color)
                .font(.title)
            VStack(alignment: .leading) {
                Text(label)
                    .strikethrough(done ? true : false)
                    .foregroundColor(done ? .secondary : .primary)
                    .bold()
                    .opacity(0.7)
                Text(hour)
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

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(label: "Task", done: false, color: .green, hour: "13:03")
            .preferredColorScheme(.dark)
    }
}
