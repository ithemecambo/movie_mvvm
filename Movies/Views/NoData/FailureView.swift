//
//  FailureView.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import SwiftUI

struct FailureView: View {
    var body: some View {
        VStack (spacing: 20) {
            Image(systemName: "magnifyingglass")
                .font(.largeTitle)
                .imageScale(.large)
            Text("Search Not Found")
        }
    }
}

#Preview {
    FailureView()
}
