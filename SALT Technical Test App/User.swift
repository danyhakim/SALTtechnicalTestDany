//
//  User.swift
//  SALT Technical Test App
//
//  Created by Dany Elita on 08/11/22.
//  Copyright © 2022 Dany Hakim. All rights reserved.

import Foundation

// MARK: - Welcome
class User: Codable {
    let data: DataClass
    let support: Support

    init(data: DataClass, support: Support) {
        self.data = data
        self.support = support
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }

    init(id: Int, email: String, firstName: String, lastName: String, avatar: String) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
}

// MARK: - Support
class Support: Codable {
    let url: String
    let text: String

    init(url: String, text: String) {
        self.url = url
        self.text = text
    }
}
