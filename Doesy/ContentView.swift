//
//  ContentView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 16.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9811814427, green: 0.9878709912, blue: 1, alpha: 1))
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("CATEGORIES")
                    .font(.system(.footnote))
                    .opacity(0.4)
                    .padding()
                    .padding(.top)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0 ..< 5) { item in
                            CardView()
                                .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 4)
                        }
                    }
                    .padding()
                }
                Text("TODAY'S TASKS")
                    .font(.system(.footnote))
                    .opacity(0.4)
                    .padding()
                ScrollView(showsIndicators: false) {
                    ForEach(0 ..< 5) { item in
                        RowView()
                            .shadow(color: .black.opacity(0.03), radius: 8, x: 0, y: 4)
                    }
                }
                .padding()
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "plus")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(color: .blue.opacity(0.3), radius: 10, y: 10)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}


struct CardView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Spacer()
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
                            .fill(Color(#colorLiteral(red: 0.8735848069, green: 0.2416511774, blue: 0.912528336, alpha: 1)))
                            .frame(width: 100)
                            .shadow(color: Color(#colorLiteral(red: 0.8735848069, green: 0.2416511774, blue: 0.912528336, alpha: 1)).opacity(0.4), radius: 5)
                        Spacer()
                    }
                )
        }
        .frame(maxHeight: 80)
        .padding()
        .padding(.vertical, 15)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct RowView: View {
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .foregroundColor(Color(#colorLiteral(red: 0.8735848069, green: 0.2416511774, blue: 0.912528336, alpha: 1)))
            Text("Daily meeting with team")
                .opacity(0.7)
            Spacer()
        }
        .padding()
        .padding(.vertical, 8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
