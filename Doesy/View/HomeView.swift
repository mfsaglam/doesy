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
            HomeViewContent()
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
