//
//  CategoryRowView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import SwiftUI

struct CategoryRowView: View {
    
    @StateObject var viewModel: DoeasyViewModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text("\(viewModel.tasks.count) tasks")
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

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(viewModel: DoeasyViewModel())
            .preferredColorScheme(.dark)
    }
}
