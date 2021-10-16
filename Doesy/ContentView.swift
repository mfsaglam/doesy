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
                Text("What's up, Joy!")
                    .font(.largeTitle)
                    .bold()
                Text("CATEGORIES")
                    .font(.system(.footnote))
                    .opacity(0.4)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0 ..< 5) { item in
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
                                                .fill(Color(#colorLiteral(red: 0.8735848069, green: 0.2416511774, blue: 0.912528336, alpha: 1)))
                                            .frame(width: 100)
                                            .shadow(color: Color(#colorLiteral(red: 0.8735848069, green: 0.2416511774, blue: 0.912528336, alpha: 1)).opacity(0.4), radius: 5)
                                            Spacer()
                                        }
                                    )
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: .black.opacity(0.2), radius: 40, x: 0, y: 20)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

