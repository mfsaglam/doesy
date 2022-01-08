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
                        CategoryRowView(category: category)
                            .shadow(color: .black.opacity(0.17), radius: 8, x: 0, y: 7)
                            .padding(.vertical, 20)
                            .onTapGesture {
                                viewModel.updateSelectedCategory(category)
                            }
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
            //MARK: - Crashes here, fix it
            if let category = viewModel.selectedCategory {
                if category.tasks.count != 0 {
                    List {
                        ForEach(category.tasks) { task in
                            TaskRowView(task: task)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    withAnimation(.interactiveSpring()) {
                                        viewModel.updateTask(category: category, task.id)
                                    }
                                }
                        }
                        .onDelete { indexSet in
                            viewModel.deleteTask(category: category, indexSet)
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
            Spacer()
        }
    }
}

struct CategoriesAndTask_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesAndTasks()
    }
}
