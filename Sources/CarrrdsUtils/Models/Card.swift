//
//  Card.swift
//  CarrrdsUtils
//
//  Created by Alex Nagy on 11.02.2025.
//

import SwiftUI
@preconcurrency import FirebaseFirestore
import FirestoreCollection

public struct Card: Firestorable {
    
    //MARK: - Firestorable requirements
    
    @DocumentID public var id: String?
    @ServerTimestamp public var createdAt: Timestamp?
    @ServerTimestamp public var updatedAt: Timestamp?
    public var userId: String = ""
    
    public var createdDate: Date {
        createdAt?.dateValue() ?? Date()
    }
    
    public var updatedDate: Date {
        updatedAt?.dateValue() ?? Date()
    }
    
    //MARK: - Custom properties
    
    public var title: String
    
    public init(title: String = "") {
        self.title = title
    }
    
    //MARK: - Codable implementation
    
    public enum CodingKeys: CodingKey {
        case id
        case createdAt
        case updatedAt
        case userId
        case title
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(DocumentID.self, forKey: .id)
        self._createdAt = try container.decodeIfPresent(ServerTimestamp<Timestamp>.self, forKey: .createdAt) ?? ServerTimestamp(wrappedValue: Timestamp(date: .now))
        self._updatedAt = try container.decodeIfPresent(ServerTimestamp<Timestamp>.self, forKey: .updatedAt) ?? ServerTimestamp(wrappedValue: Timestamp(date: .now))
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self._createdAt, forKey: .createdAt)
        try container.encodeIfPresent(self._updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.title, forKey: .title)
    }
}



