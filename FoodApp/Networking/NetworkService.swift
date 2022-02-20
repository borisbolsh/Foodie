import Foundation

struct NetworkService {
  static let shared = NetworkService()
  private init() {}

  private func request<T: Decodable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping(Result<T, Error>) -> Void) {
  }

}
