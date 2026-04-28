import XCTest
@testable import TMDB

class SearchFilmsWorkerMock: SearchFilmsWorkerProtocol {
    var fetchCalled = false
    var shouldReturnError = false

    func fetch(query: String, completion: @escaping (Result<SearchFilmsResponse, Error>) -> Void) {
        fetchCalled = true
        if shouldReturnError {
            completion(.failure(NSError(domain: "test", code: 1)))
        } else {
            if let url = Bundle.main.url(forResource: "film_list", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let film_detail = try decoder.decode(SearchFilmsResponse.self, from: data)
                    completion(.success(film_detail))
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                }
            }

        }
    }
}


