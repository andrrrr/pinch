// swiftlint:disable identifier_name

struct Game: Codable {
    let id: Int?
    let category: Int?
    let created_at: Int?
    let external_games: [Int]?
    let first_release_date: Double?
    let genres: [Int]?
    let name: String?
    let platforms: [Int]?
    let release_dates: [Int]?
    let similar_games: [Int]?
    let slug: String?
    let summary: String?
    let tags: [Int]?
    let updated_at: Int?
    let url: String?
    let cover: Cover?
    let screenshots: [Screenshot]?
}

struct Cover: Codable {
    let id: Int?
    let url: String?
}

struct Screenshot: Codable {
    let id: Int?
    let url: String?
}
