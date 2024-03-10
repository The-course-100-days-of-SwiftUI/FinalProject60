//
//  File.swift
//  FinalProject60
//
//  Created by Margarita Mayer on 21/01/24.
//

import SwiftData
import Foundation


@Model
class User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _isActive = "isActive"
        case _name = "name"
        case _age = "age"
        case _company = "company"
        case _email = "email"
        case _address = "address"
        case _about = "about"
        case _registered = "registered"
        case _tags = "tags"
        case _friends = "friends"
        
    }
    
        let id: String
        let isActive: Bool
        let name: String
        let age: Int
        let company: String
        let email: String
        let address: String
        let about: String
        let registered: String
        let tags: [String]
        let friends: [Friend]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: ._name)
        self.id = try container.decode(String.self, forKey: ._id)
        self.age = try container.decode(Int.self, forKey: ._age)
        self.isActive = try container.decode(Bool.self, forKey: ._isActive)
        self.company = try container.decode(String.self, forKey: ._company)
        self.email = try container.decode(String.self, forKey: ._email)
        self.address = try container.decode(String.self, forKey: ._address)
        self.about = try container.decode(String.self, forKey: ._about)
        self.registered = try container.decode(String.self, forKey: ._registered)
        self.tags = try container.decode([String].self, forKey: ._tags)
        self.friends = try container.decode([Friend].self, forKey: ._friends)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: ._name)
        try container.encode(self.id, forKey: ._id)
        try container.encode(self.age, forKey: ._age)
        try container.encode(self.isActive, forKey: ._isActive)
        try container.encode(self.company, forKey: ._company)
        try container.encode(self.email, forKey: ._email)
        try container.encode(self.address, forKey: ._address)
        try container.encode(self.about, forKey: ._about)
        try container.encode(self.registered, forKey: ._registered)
        try container.encode(self.tags, forKey: ._tags)
        try container.encode(self.friends, forKey: ._friends)
    }
   
    
}

