import XCTest
@testable import TMDB

class DetailFilmWorkerMock: DetailFilmWorkerProtocol {
    var fetchCalled = false
    var shouldReturnError = false

    func fetch(id: Int, completion: @escaping (Result<DetailFilmResponse, Error>) -> Void) {
        fetchCalled = true
        if shouldReturnError {
            completion(.failure(NSError(domain: "test", code: 1)))
        } else {
            if let url = Bundle.main.url(forResource: "film_detail", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let filmDetail = try decoder.decode(DetailFilmResponse.self, from: data)
                    completion(.success(filmDetail))
                } catch {
                    print("❌ Erro ao decodificar JSON: \(error)")
                }
            }

        }
    }
}
