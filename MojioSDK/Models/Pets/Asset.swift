/******************************************************************************
 * Moj.io Inc. CONFIDENTIAL
 * 2017 Copyright Moj.io Inc.
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains, the property of
 * Moj.io Inc. and its suppliers, if any.  The intellectual and technical
 * concepts contained herein are proprietary to Moj.io Inc. and its suppliers
 * and may be covered by Patents, pending patents, and are protected by trade
 * secret or copyright law.
 *
 * Dissemination of this information or reproduction of this material is strictly
 * forbidden unless prior written permission is obtained from Moj.io Inc.
 *******************************************************************************/

import Foundation
import MojioCore

public enum AssetType: String, Codable {
    case pet = "Pet"
    case unknown = "Unknown"
    case other = "Other"
}

public protocol AssetModel: Codable, PrimaryKey {
    
    associatedtype L: PetsLocationModel
    associatedtype D: PetDetailsModel
    associatedtype A: DisplayDetailsModel
    
    var id: String { get }
    var name: String? { get }
    var deviceId: String? { get }
    var location: L? { get }
    var speed: Double? { get }
    var type: AssetType? { get }
    var pet: D? { get }
    var displayDetails: A? { get }
    var ownerId: String? { get }
    var deleted: Bool? { get }
    var createdOn: Date? { get }
    var lastModified: Date? { get }
}

public struct Asset: AssetModel {
    
    public typealias L = PetsLocation
    public typealias D = PetDetails
    public typealias A = DisplayDetails
    
    public let id: String
    public let name: String?
    public let deviceId: String?
    public let location: L?
    public let speed: Double?
    public let type: AssetType?
    public let pet: D?
    public let displayDetails: A?
    public let ownerId: String?
    public let deleted: Bool?
    public let createdOn: Date?
    public let lastModified: Date?
    
    public enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case deviceId = "DeviceId"
        case location = "Location"
        case speed = "Speed"
        case type = "Type"
        case pet = "PetDetails"
        case displayDetails = "DisplayDetails"
        case ownerId = "OwnerId"
        case deleted = "Deleted"
        case createdOn = "CreatedOn"
        case lastModified = "LastModified"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            self.id = try container.decode(String.self, forKey: .id)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.deviceId = try container.decodeIfPresent(String.self, forKey: .deviceId)
            self.location = try container.decodeIfPresent(PetsLocation.self, forKey: .location)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.type = try container.decodeIfPresent(String.self, forKey: .type).flatMap { AssetType(rawValue: $0) }
            self.pet = try container.decodeIfPresent(PetDetails.self, forKey: .pet)
            self.displayDetails = try container.decodeIfPresent(DisplayDetails.self, forKey: .displayDetails)
            self.ownerId = try container.decodeIfPresent(String.self, forKey: .ownerId)
            self.deleted = try container.decodeIfPresent(Bool.self, forKey: .deleted)
            self.createdOn = try container.decodeIfPresent(String.self, forKey: .createdOn).flatMap { $0.dateFromIso8601 }
            self.lastModified = try container.decodeIfPresent(String.self, forKey: .lastModified).flatMap { $0.dateFromIso8601 }
        }
        catch {
            debugPrint(error)
            throw error
        }
    }
}

public func ==(lhs: Asset, rhs: Asset) -> Bool {
    return lhs.id == rhs.id
}

public struct AssetUpdate: Codable {
    public var name: String? = nil
    public var type: AssetType? = nil
    public var displayDetails: DisplayDetailsUpdate? = nil
    public var pet: PetDetailsUpdate? = nil
    
    public enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case displayDetails = "DisplayDetails"
        case pet = "PetDetails"
    }
    
    public init(asset: Asset? = nil) {
        self.init(
            name: asset?.name,
            location: asset?.location,
            type: asset?.type,
            displayDetails: DisplayDetailsUpdate(from: asset?.displayDetails),
            pet: PetDetailsUpdate(petDetails: asset?.pet)
        )
    }
    
    public init(
        name: String? = nil,
        location: PetsLocation? = nil,
        type: AssetType? = nil,
        displayDetails: DisplayDetailsUpdate? = nil,
        pet: PetDetailsUpdate? = nil) {
        
        self.name = name
        self.type = type
        self.displayDetails = displayDetails
        self.pet = pet
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.displayDetails, forKey: .displayDetails)
        try container.encodeIfPresent(self.pet, forKey: .pet)
    }
}
