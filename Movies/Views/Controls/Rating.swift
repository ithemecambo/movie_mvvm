//
//  RatingView.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import SwiftUI

struct Rating: View {
    @Binding var rating: Int?
    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...10, id: \.self) { index in
                Image(systemName: self.starType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                }
            }
        }
    }
}

#Preview {
    Rating(rating: .constant(3))
}
