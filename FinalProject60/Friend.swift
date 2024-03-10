//
//  Friend.swift
//  FinalProject60
//
//  Created by Margarita Mayer on 21/01/24.
//

import SwiftData
import Foundation

@Model
class Friend: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _name = "name"
    }
    
    var id: String
    var name: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: ._name)
        self.id = try container.decode(String.self, forKey: ._id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: ._name)
        try container.encode(self.id, forKey: ._id)
    }
    
}
