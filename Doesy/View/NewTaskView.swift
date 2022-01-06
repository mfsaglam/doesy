//
//  NewTaskView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 27.10.2021.
//

import SwiftUI

struct NewTaskView: View {
    @State var taskTitle = ""
    @State var categoryTitle = ""
    @State var color = Color.red
    @State var date: Date = .now
    @State var shouldShowDatePicker = false
    @State var shouldShowTitleAlert = false
        
    @EnvironmentObject var viewModel: DoeasyViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                TextField(viewModel.categories.isEmpty ? "Enter new category" : "Enter new task", text: viewModel.categories.isEmpty ? $categoryTitle : $taskTitle)
                    .font(.title)
                    .padding()
                HStack {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Today")
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
                    Image(systemName: "folder.badge.plus")
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
                            if taskTitle.count == 0 {
                                shouldShowTitleAlert = true
                            } else {
                                let newTask = Task()
                                newTask.title = taskTitle
                                newTask.color = UIColor(color).toHex ?? ""
                                newTask.time = date
                                viewModel.addNewTask(newTask)
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
    }
}


