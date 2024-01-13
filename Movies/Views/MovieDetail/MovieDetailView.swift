//
//  MovieDetailView.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/12/24.
//

import SwiftUI

struct MovieDetailView: View {
    let viewModel: MovieDetialViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: viewModel.poster)
                    .cornerRadius(10)
                Text(viewModel.title)
                    .font(.title)
                Text(viewModel.plot)
                Text("Director").fontWeight(.bold)
                Text(viewModel.director)
                Text("Language").fontWeight(.bold)
                Text(viewModel.language)
                HStack {
                    Rating(rating: .constant(viewModel.rating))
                    Text("\(viewModel.rating)/10")
                }
                .padding(.top, 10)
                Spacer()
            }
            .padding()
            .navigationBarTitle(viewModel.title)
        }
    }
}

