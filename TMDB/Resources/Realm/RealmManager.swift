import Foundation
import RealmSwift

protocol RealmManagerProtocol {
    func saveFilm(_ film: DetailFilmResponse)
    func deleteFilm(_ filmId: Int)
    func isSaved(_ film: Int) -> Bool
    func fetchAll() -> [DetailFilmResponse]
}

final class RealmManager: RealmManagerProtocol {

    static let shared = RealmManager()
    private let realm: Realm

    private init() {
        do {
            let config = Realm.Configuration(
                schemaVersion: 1,
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion < 1 {
                    }
                }
            )

            Realm.Configuration.defaultConfiguration = config
            realm = try Realm()

        } catch {
            print("⚠️ Erro ao inicializar o Realm: \(error)")
            fatalError("Erro ao inicializar o Realm: \(error)")
        }
    }

    func saveFilm(_ film: DetailFilmResponse) {
        do {
            try realm.write {
                realm.add(film, update: .modified)
            }
        } catch {
            print("Erro ao salvar filme: \(error)")
        }
    }

    func deleteFilm(_ filmId: Int) {
        do {
            if let filmToDelete = realm.object(ofType: DetailFilmResponse.self, forPrimaryKey: filmId) {
                try realm.write {
                    realm.delete(filmToDelete)
                }
            }
        } catch {
            print("Erro ao excluir filme: \(error)")
        }
    }

    func isSaved(_ film: Int) -> Bool {
       return realm.object(ofType: DetailFilmResponse.self, forPrimaryKey: film) != nil
    }

    func fetchAll() -> [DetailFilmResponse] {
        return Array(realm.objects(DetailFilmResponse.self))
    }
}
