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
