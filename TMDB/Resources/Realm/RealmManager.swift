import Foundation
import RealmSwift

final class RealmManager {

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

    func isFilmSaved(_ film: Int) -> Bool {
       return realm.object(ofType: DetailFilmResponse.self, forPrimaryKey: film) != nil
    }

    func fetchAllFilms() -> [DetailFilmResponse] {
        return Array(realm.objects(DetailFilmResponse.self))
    }
}
