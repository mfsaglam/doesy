//
//  HomeViewContent.swift
//  Doesy
//
//  Created by Fatih Sağlam on 6.01.2022.
//

import SwiftUI

struct HomeViewContent: View {
    @EnvironmentObject var viewModel: DoeasyViewModel
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
        //MARK: - CATEGORIES AND TASKS
            if !viewModel.categories.isEmpty {
                CategoriesAndTasks()
            } else {
                VStack {
                    Spacer()
                    Image(systemName: "scribble.variable")
                        .foregroundColor(.primary)
                        .opacity(0.3)
                        .font(.system(size: 50))
                    Text("The file is currently empty. \nStart by adding a category.")
                        .font(.system(.title3))
                        .multilineTextAlignment(.center)
                        .opacity(0.3)
                        .padding(.horizontal, 70)
                        .padding(.top, 60)
                    Spacer()
                }
            }
            
        //MARK: - PLUS BUTTON
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    NavigationLink(destination: NewTaskView(selectedCategory: viewModel.selectedCategory)) {
                        OnScreenPlusButton()
                            .shadow(color: Color("OnScreenButton").opacity(0.3), radius: 10, y: 10)
                    }
                }
                .padding(.trailing)
            }
        }
        
        //MARK: - TOOLBAR
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
}

struct HomeViewContent_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewContent()
    }
}
