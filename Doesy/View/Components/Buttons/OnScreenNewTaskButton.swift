//
//  OnScreenNewTaskButton.swift
//  Doesy
//
//  Created by Fatih Sağlam on 5.01.2022.
//

import SwiftUI

struct OnScreenNewTaskButton: View {
    var isTask: Bool
    var body: some View {
        HStack {
            Text(isTask ? "New task": "New category")
            Image(systemName: "chevron.up")
        }
        .padding()
        .padding(.horizontal, 20)
        .foregroundColor(.white)
        .background(Color("OnScreenButton"))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct OnScreenNewTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        OnScreenNewTaskButton(isTask: false)
            .preferredColorScheme(.dark)
    }
}
