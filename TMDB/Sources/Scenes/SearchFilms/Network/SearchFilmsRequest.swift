import Foundation

struct SearchFilmsRequest: Request {

    var host: String?

    var path: String

    var method: Method

    var body: AnyHashable?

    var params: [String : AnyHashable]?

    var header: [String : AnyHashable]?

    init(host: String? = TMDBSettings.baseURL,
         path: String,
         method: Method,
         body: AnyHashable? = nil,
         params: [String : AnyHashable]? = nil,
         header: [String : AnyHashable]? = ["Authorization": TMDBSettings.apiKey]) {

        self.host = host
        self.path = path
        self.method = method
        self.body = body
        self.params = params
        self.header = header
    }
}
