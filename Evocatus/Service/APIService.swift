import Foundation

class APIService {

    static func requestEvents(completion: @escaping (Result<Message, Error>) -> Void) {
        URLSession
            .init(configuration: .default)
            .dataTask(with: URL(string: "https://api.legion-hack.ru/employee/7/e-tinder/")!)
        { data, responce, error in
            if let _ = error {
                completion(.failure(APIError.internalError))
                return
            }
            if let data = data,
               let result = try? JSONDecoder().decode(TopLevel.self, from: data) {
                completion(.success(result.message))
                return
            }
            completion(.failure(APIError.internalError))
        }.resume()
    }

    private struct TopLevel: Decodable {
        let success: Bool
        let message: Message
    }

    struct Message: Decodable {
        let employee: [Event]
        let other: [Event]
    }

    enum APIError: Error {
        case internalError
    }
}
