//
//  ViewModelBase.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import SwiftUI

enum LoadingState {
    case loading
    case success
    case failure
    case none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
