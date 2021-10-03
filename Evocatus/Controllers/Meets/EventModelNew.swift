import Foundation

// MARK: - TopLevel
struct TopLevel: Codable {
    let success: Bool
    let message: Message
}

// MARK: - Message
struct Message: Codable {
    let employee: [Event]
    let other: [Event]
}

// MARK: - Employee
struct Event: Codable {
    let id, creator: Int
    let name, category, photoURL, place: String
    let dttm: String

    enum CodingKeys: String, CodingKey {
        case id, creator, name, category
        case photoURL = "photo_url"
        case place, dttm
    }
}
