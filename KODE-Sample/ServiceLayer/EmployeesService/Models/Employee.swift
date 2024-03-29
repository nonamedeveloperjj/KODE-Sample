//
//  Employee.swift
//  KODE-Sample
//
//  Created by John Snow on 02/11/2022.
//

import Foundation

struct Employee: Decodable, Identifiable {
    let id: String
    let avatarUrl: String
    let firstName: String
    let lastName: String
    let userTag: String
    let department: Department
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
    
    enum Department: String, Decodable {
        case design
        case analytics
        case management
        case iOS = "ios"
        case android
        case backend
        case support
        case QA = "qa"
        case backOffice = "back_office"
        case frontend
        case PR = "pr"
        case HR = "hr"
        case unknown
    }
    
    internal init(
        id: String,
        avatarUrl: String,
        firstName: String,
        lastName: String,
        userTag: String,
        department: Department,
        position: String,
        birthday: Date,
        phone: String
    ) {
        self.id = id
        self.avatarUrl = avatarUrl
        self.firstName = firstName
        self.lastName = lastName
        self.userTag = userTag
        self.department = department
        self.position = position
        self.birthday = birthday
        self.phone = phone
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        
        // Using hardcoded url due to invalid avatar urls from server
        let randomAvatarNumber = Int.random(in: 0...262)
        let stubAvatarUrl = "https://raw.githubusercontent.com/nonamedeveloperjj/fake-avatars/main/avatars/\(randomAvatarNumber).png"
        self.avatarUrl = stubAvatarUrl
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.userTag = try container.decode(String.self, forKey: .userTag)
        self.department = (try? container.decode(Department.self, forKey: .department)) ?? .unknown
        self.position = try container.decode(String.self, forKey: .position)
        let birthday = try container.decode(String.self, forKey: .birthday)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.birthday = dateFormatter.date(from: birthday) ?? Date()
        self.phone = try container.decode(String.self, forKey: .phone)
    }
}

extension Employee {
    static let placeholderModel = Employee(
        id: "id",
        avatarUrl: "https://raw.githubusercontent.com/nonamedeveloperjj/fake-avatars/main/avatars/8.png",
        firstName: "Андрей",
        lastName: "Иванов",
        userTag: "QA",
        department: .PR,
        position: "Specialist",
        birthday: Calendar.current.date(from: DateComponents(year: 1996, month: 6, day: 5)) ?? Date(),
        phone: "997-546-8116"
    )
}
