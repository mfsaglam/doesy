//
//  CategoryRowView.swift
//  Doesy
//
//  Created by Fatih Sağlam on 12.12.2021.
//

import SwiftUI

struct CategoryRowView: View {
        
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Text("\(category.tasks.count) tasks")
                .font(.caption)
                .opacity(0.4)
            Text(category.title)
                .font(.title2)
                .bold()
            Capsule(style: .continuous)
                .fill(Color.secondary)
                .opacity(0.3)
                .frame(width: 180, height: 3)
                .overlay(
                    HStack {
                        Capsule(style: .continuous)
                            .fill(Color(hex: category.color))
                            .frame(width: 100)
                            .shadow(color: Color(hex: category.color).opacity(0.4), radius: 5)
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

//struct CategoryRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRowView()
//            .preferredColorScheme(.dark)
//    }
//}
