//
//  NewTaskView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 27.10.2021.
//

import SwiftUI

struct NewTaskView: View {
    @State var title = ""
    @State var color = Color.red
    @State var date: Date = .now
    
    @State var shouldShowDatePicker = false
    @State var shouldShowTitleAlert = false
    @State var isCategory: Bool = false
    
    var selectedCategory: Category?
        
    @EnvironmentObject var viewModel: DoeasyViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                TextField(isCategory ? "Enter new category" : "Enter new task", text: $title)
                    .font(.title)
                    .padding()
                HStack {
                    if !isCategory {
                        HStack {
                            Image(systemName: "calendar")
                            //TODO: - Format the date
                            Text("\(viewModel.timeForRow(time: date))")
                                .lineLimit(1)
                        }
                        .font(.title3)
                        .opacity(0.6)
                        .padding()
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .stroke(lineWidth: 2)
                                .opacity(0.1)
                        )
                        .onTapGesture {
                            withAnimation(.interactiveSpring()) {
                                shouldShowDatePicker.toggle()
                            }
                        }
                    }
                    ColorPicker("", selection: $color)
                        .offset(x: -55)
                        .padding()
                        .background(
                            Circle()
                                .stroke(lineWidth: 2)
                                .opacity(0.1)
                        )
                        .offset(x: -55)
                }
                
                if shouldShowDatePicker {
                    DatePicker(selection: $date, label: { Text("Date") })
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
                HStack(spacing: 50) {
                    Spacer()
                    if isCategory {
                        Image(systemName: "folder.badge.plus")
                            .renderingMode(.original)
                            .foregroundColor(Color("OnScreenButton"))
                            .onTapGesture {
                                isCategory.toggle()
                            }
                    } else {
                        Image(systemName: "folder.badge.plus")
                            .onTapGesture {
                                if !viewModel.categories.isEmpty {
                                    isCategory.toggle()
                                }
                            }
                    }
                    Image(systemName: "flag")
                    Image(systemName: "moon")
                    Spacer()
                }
                .padding(.top, 150)
                .font(.title3)
                .opacity(0.5)
            }
            .padding(.horizontal, 30)
            
            VStack {
                HStack {
                    Spacer()
                    CircularDismissButton()
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                Spacer()
                HStack {
                    Spacer()
                    OnScreenNewTaskButton(isTask: !viewModel.categories.isEmpty)
                        .shadow(color: Color("OnScreenButton").opacity(0.2), radius: 10, x: 0, y: 20)
                        .onTapGesture {
                            if title.count == 0 {
                                shouldShowTitleAlert = true
                            } else {
                                if isCategory {
                                    let newCategory = Category()
                                    newCategory.title = title
                                    newCategory.color = UIColor(color).toHex ?? ""
                                    viewModel.addNewCategory(newCategory)
                                } else if let category = selectedCategory {
                                    let newTask = Task()
                                    newTask.title = title
                                    newTask.color = UIColor(color).toHex ?? ""
                                    newTask.time = date
                                    viewModel.addNewTask(category: category, newTask)
                                }
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        .alert("Please enter a text.", isPresented: $shouldShowTitleAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                }
                .padding(.trailing, 40)
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            if viewModel.categories.isEmpty {
                isCategory = true
            }
        }
    }
}


