//
//  ContentView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 16.10.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = DoeasyViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("CATEGORIES")
                        .font(.system(.footnote))
                        .opacity(0.4)
                        .padding(.leading)
                        .padding(.top, 35)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0 ..< 5) { item in
                                CardView()
                                    .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 4)
                            }
                        }
                        .padding(.leading)
                        .padding(.top, 8)
                    }
                    Text("TODAY'S TASKS")
                        .font(.system(.footnote))
                        .opacity(0.4)
                        .padding(.leading)
                        .padding(.top, 25)
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.tasks) { item in
                            RowView(label: item.title, done: item.done, color: item.color, hour: viewModel.timeForRow(time: item.time))
                                .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 4)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Text("Delete")
                                }
                                .onTapGesture {
                                    withAnimation(.interactiveSpring()) {
                                        viewModel.updateTask(item.id)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .padding(.bottom, 5)
                }
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        NavigationLink(destination: NewTaskView()) {
                            OnScreenPlusButton()
                                .shadow(color: Color("OnScreenButton").opacity(0.3), radius: 10, y: 10)
                        }
                    }
                    .padding(.trailing)
                }
            }
            .navigationTitle("What's up, Joy!")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "line.3.horizontal")
                        .opacity(0.5)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .opacity(0.5)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell")
                        .opacity(0.5)
                }
            }
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
        HomeView()
        
    }
}


struct CardView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text("40 tasks")
                .font(.caption)
                .opacity(0.4)
            Text("Business")
                .font(.title2)
                .bold()
            Capsule(style: .continuous)
                .fill(Color.secondary)
                .opacity(0.3)
                .frame(width: 180, height: 3)
                .overlay(
                    HStack {
                        Capsule(style: .continuous)
                            .fill(Color("AccentColorPink"))
                            .frame(width: 100)
                            .shadow(color: Color("AccentColorPink").opacity(0.4), radius: 5)
                        Spacer()
                    }
                )
                .padding(.top)
        }
        .frame(maxHeight: 80)
        .padding()
        .padding(.vertical, 5)
        .background(Color("Cell"))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct RowView: View {
    var label: String
    var done: Bool
    var color: String
    var hour: String
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: done ? "checkmark.circle" : "circle")
                .foregroundColor(done ? Color.secondary : Color(color))
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

struct OnScreenPlusButton: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.title)
            .padding()
            .background(Color("OnScreenButton"))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}
