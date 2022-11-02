//
//  Employee.swift
//  KODE-Sample
//
//  Created by John Snow on 02/11/2022.
//

import Foundation

struct Employee: Decodable {
    let id: String
    let avatarUrl: String
    let firstName: String
    let lastName: String
    let userTag: String
    let department: String
    let position: String
    let birthday: Date
    let phone: String
    
    enum CodingKeys: CodingKey {
        case id
        case avatarUrl
        case firstName
        case lastName
        case userTag
        case department
        case position
        case birthday
        case phone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.userTag = try container.decode(String.self, forKey: .userTag)
        self.department = try container.decode(String.self, forKey: .department)
        self.position = try container.decode(String.self, forKey: .position)
        let birthday = try container.decode(String.self, forKey: .birthday)
        
        let dateFormatter = DateFormatter()
        self.birthday = dateFormatter.date(from: birthday) ?? Date()
        self.phone = try container.decode(String.self, forKey: .phone)
    }
}
