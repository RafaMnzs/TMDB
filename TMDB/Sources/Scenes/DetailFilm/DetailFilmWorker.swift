
import Foundation

protocol DetailFilmWorkerProtocol {
    func fetch(id: Int, completion: @escaping (Result<DetailFilmResponse, Error>) -> Void)
}

public class DetailFilmWorker: DetailFilmWorkerProtocol {
    func fetch(id: Int, completion: @escaping (Result<DetailFilmResponse, any Error>) -> Void) {
        let request = DetailFilmRequest(
            path: "/movie/\(id)",
            method: .GET)

        Dispatcher.shared.execute(request, to: DetailFilmResponse.self) { result in
            completion(result)
        }
    }
}
