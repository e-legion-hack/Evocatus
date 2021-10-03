struct Event: Decodable {
    let id, creator: Int
    let category: FilterItem.Kind
    let photoURL: String?
    let name, place: String
    let dttm: String

    enum CodingKeys: String, CodingKey {
        case id, creator, name, category
        case photoURL = "photo_url"
        case place, dttm
    }
}
