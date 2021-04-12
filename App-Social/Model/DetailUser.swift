//
//  DetailUser.swift
//  App-Social
//
//  Created by Natanael Diego on 12/04/21.
//

import Foundation

// MARK: - DetailUser
struct DetailUser: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
