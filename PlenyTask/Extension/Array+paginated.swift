//
//  Array+paginated.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/16/23.
//

import Foundation

extension Array where Element == Post {
    func paginated(limit: Int, skip: Int) -> [Post] {
        let startIndex = Swift.max(0, skip) // Ensure startIndex is non-negative
        let endIndex = Swift.min(startIndex + limit, self.count) // Limit endIndex to array bounds

        guard startIndex < endIndex else {
            return [] // Return an empty array if startIndex is greater or equal to endIndex
        }

        return Array(self[startIndex..<endIndex])
    }
}
