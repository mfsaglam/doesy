//
//  HomeScreenPlusButton.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import SwiftUI

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

struct HomeScreenPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        OnScreenPlusButton()
    }
}
