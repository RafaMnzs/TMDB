import XCTest
@testable import TMDB

class SavedFilmWorkerMock: SavedFilmsWorkerProtocol {
    var fetchCalled = false
    var shouldReturnError = false

    func fetch(completion: @escaping (Result<[Film], any Error>) -> Void) {
        fetchCalled = true
        if shouldReturnError {
            completion(.failure(NSError(domain: "test", code: 1)))
        } else {
            if let url = Bundle.main.url(forResource: "film_list", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let film_detail = try decoder.decode(SearchFilmsResponse.self, from: data)
                    completion(.success(film_detail.list))
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                }
            }
        }
    }
}
