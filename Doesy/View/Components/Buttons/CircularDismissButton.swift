//
//  CircularDismissButton.swift
//  Doesy
//
//  Created by Fatih Sağlam on 5.01.2022.
//

import SwiftUI

struct CircularDismissButton: View {
    var body: some View {
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
}

struct CircularDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        CircularDismissButton()
    }
}
