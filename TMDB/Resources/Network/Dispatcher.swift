import Foundation

protocol DispatcherProtocol {
    func execute<T: Codable>(_ request: Request, to type: T.Type, debug: Bool?, completion: @escaping(Result<T, Error>) -> Void)
}

public class Dispatcher: DispatcherProtocol {

   public static var shared: Dispatcher = {
        let instance = Dispatcher()
        return instance
    }()

    public func execute<T: Decodable>(_ request: Request, to type: T.Type, debug: Bool? = false, completion: @escaping (Result<T, Error>) -> Void) {
        var config = NSMutableURLRequest()
        guard let host = request.host else { return }
        config.url = URL(string: "\(host)\(request.path)\(query(with: request.params, config: &config))")
        header(header: request.header, config: &config)
        switch request.method {
        case .GET:
            config.httpMethod = request.method.rawValue
        case .POST:
            config.httpMethod = request.method.rawValue
            config.httpBody = try? JSONSerialization.data(withJSONObject: request.body as Any, options: .prettyPrinted)
        case .PUT:
            config.httpMethod = request.method.rawValue
            config.httpBody = try? JSONSerialization.data(withJSONObject: request.body as Any, options: .prettyPrinted)
        case .DELETE:
            config.httpMethod = request.method.rawValue
            config.httpBody = try? JSONSerialization.data(withJSONObject: request.body as Any, options: .prettyPrinted)
        }

        let session = URLSession.shared
        session.dataTask(with: config as URLRequest, completionHandler: { data, response, error  in
            if error != nil {
                if let err = error {
                    completion(.failure(err))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            guard 200 ..< 300 ~= httpResponse.statusCode else {
                completion(.failure(Status(statusCode: httpResponse.statusCode)))
                return
            }

            DispatchQueue.global(qos: .background).async {
                do {
                    guard let data = data else { return }
                    self.show(debug: debug, request: config, content: data)
                    let content = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(content))
                } catch {
                    completion(.failure(error))
                }
            }
        }).resume()
    }
}

private extension Dispatcher {

    private func header(header: [String: AnyHashable]?, config: inout NSMutableURLRequest) {
        guard let params = header else { return }
        for (key, value) in params {
            config.addValue(value.description, forHTTPHeaderField: key)
        }
    }

    private func query(with query: [String: AnyHashable]?, config: inout NSMutableURLRequest) -> String  {
        guard let queries = query else { return  String() }
        var query = String()
        for (index, (key, value)) in queries.enumerated() {
            if index == 0 {
                query = "?\(key)=\(value)"
            } else {
                query = "\(query)&\(key)=\(value)"
            }
        }
        return query
    }

    private func show(debug: Bool?, request: NSMutableURLRequest, content: Data?) {
        guard let debug = debug,
              let content = content
                else {
                    return
                }
        if debug {
            print("<=============== REQUEST ===============>")
            print(request.httpMethod)
            print(request.url ?? String())
            print("<=============== RESPONSE ===============>")
            guard let str = content.prettyPrintedJSONString else {
                return
            }
            debugPrint(str)
        }
    }
}
