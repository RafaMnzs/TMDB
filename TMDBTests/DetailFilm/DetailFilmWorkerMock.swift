import XCTest
@testable import TMDB

class DetailFilmWorkerMock: DetailFilmWorkerProtocol {
    var fetchCalled = false
    var shouldReturnError = false

    func fetch(id: Int, completion: @escaping (Result<DetailFilmResponse, any Error>) -> Void) {
        fetchCalled = true
        if shouldReturnError {
            completion(.failure(NSError(domain: "test", code: 1)))
        } else {
            let response: DetailFilmResponse = try! loadJSON("film_detail", as: DetailFilmResponse.self)
            completion(.success(response))
        }
    }
}
