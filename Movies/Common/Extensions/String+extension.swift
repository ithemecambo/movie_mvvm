//
//  String+extension.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import Foundation


extension String {
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
