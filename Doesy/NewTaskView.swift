//
//  NewTaskView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 27.10.2021.
//

import SwiftUI

struct NewTaskView: View {
    @State var task = ""
    @State var color = Color.red
    @State var showDatePicker = false
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                TextField("Enter new task", text: $task)
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
                            showDatePicker.toggle()
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
                
                if showDatePicker {
                    DatePicker(selection: .constant(Date()), label: { Text("Date") })
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
                    Image(systemName: "xmark")
                        .font(.title3)
                        .padding()
                        .background(
                            Circle()
                                .stroke(lineWidth: 2)
                                .opacity(0.1)
                        )
                        .padding(.trailing, 40)
                }
                Spacer()
                HStack {
                    Spacer()
                    HStack {
                        Text("New task")
                        Image(systemName: "chevron.up")
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .background(Color("OnScreenButton"))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color("OnScreenButton").opacity(0.2), radius: 10, x: 0, y: 20)
                }
                .padding(.trailing, 40)
            }
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
            .preferredColorScheme(.dark)
        NewTaskView()
    }
}
