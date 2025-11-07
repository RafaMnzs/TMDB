import Foundation
import XCTest

func loadJSON<T: Decodable>(_ filename: String, as type: T.Type) throws -> T {
    let bundle = Bundle(for: DummyTestClass.self)

    guard let url = bundle.url(forResource: filename, withExtension: "json") else {
        throw NSError(domain: "FileNotFound", code: 404, userInfo: [NSLocalizedDescriptionKey: "Arquivo \(filename).json não encontrado."])
    }

    let data = try Data(contentsOf: url)
    return try JSONDecoder().decode(T.self, from: data)
}


private class DummyTestClass: XCTestCase {}
