import Foundation

protocol SearchFilmsWorkerProtocol {
    func fetch(query: String, completion: @escaping (Result<SearchFilmsResponse, Error>) -> Void)
}

public class SearchFilmsWorker: SearchFilmsWorkerProtocol {
    func fetch(query: String, completion: @escaping (Result<SearchFilmsResponse, Error>) -> Void) {
        let request = SearchFilmsRequest(
            path: "/search/movie",
            method: .GET,
            params: ["query": query])

        Dispatcher.shared.execute(request, to: SearchFilmsResponse.self) { result in
            completion(result)
        }
    }
}
