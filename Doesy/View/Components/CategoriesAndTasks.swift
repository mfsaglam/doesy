//
//  CategoriesAndTask.swift
//  Doesy
//
//  Created by Fatih Sağlam on 6.01.2022.
//

import SwiftUI

struct CategoriesAndTasks: View {
    
    @EnvironmentObject var viewModel: DoeasyViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CATEGORIES")
                .font(.system(.footnote))
                .opacity(0.4)
                .padding(.leading)
            //.padding(.top, 35)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.categories) { category in
                        CategoryRowView(title: category.title, color: category.color)
                            .shadow(color: .black.opacity(0.17), radius: 8, x: 0, y: 7)
                            .padding(.vertical, 20)
                    }
                }
                .padding(.leading)
                .padding(.top, 8)
            }
            VStack {
                Text("TODAY'S TASKS")
                    .font(.system(.footnote))
                    .opacity(0.4)
                    .padding(.leading)
                .padding(.top, 25)
            }
            if viewModel.tasks.count != 0 {
                List {
                    ForEach(viewModel.tasks) { task in
                        TaskRowView(label: task.title, done: task.done, color: Color(hex: task.color), hour: viewModel.timeForRow(time: task.time))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                withAnimation(.interactiveSpring()) {
                                    viewModel.updateTask(task.id)
                                }
                            }
                    }
                    .onDelete { indexSet in
                        viewModel.deleteTask(indexSet)
                    }
                }
                .listStyle(PlainListStyle())
            } else {
                VStack{
                    Spacer()
                    Image(systemName: "scribble.variable")
                        .font(.system(size: 40))
                        .foregroundColor(Color.black)
                        .opacity(0.3)
                    Text("There is no task today for this category.")
                        .font(.system(.title3))
                        .multilineTextAlignment(.center)
                        .opacity(0.3)
                        .padding(.horizontal, 70)
                        .padding(.top, 20)
                    Spacer()
                }
            }
        }
    }
}

struct CategoriesAndTask_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesAndTasks()
    }
}
