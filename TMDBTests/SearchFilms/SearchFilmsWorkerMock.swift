import XCTest
@testable import TMDB

class SearchFilmsWorkerMock: SearchFilmsWorkerProtocol {
    var fetchCalled = false
    var shouldReturnError = false

    func fetch(query: String, completion: @escaping (Result<SearchFilmsResponse, any Error>) -> Void) {
        fetchCalled = true
        if shouldReturnError {
            completion(.failure(NSError(domain: "test", code: 1)))
        } else {
            let response: SearchFilmsResponse = try! loadJSON("films_list", as: SearchFilmsResponse.self)
            completion(.success(response))
        }
    }
}
