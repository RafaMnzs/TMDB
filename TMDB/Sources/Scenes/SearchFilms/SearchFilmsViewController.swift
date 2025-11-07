import UIKit

final class SearchFilmsViewController: UIViewController {

    private let customView: SearchFilmsView = SearchFilmsView()

    private let viewModel: SearchFilmsViewModelProtocol?

    init(viewModel: SearchFilmsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
       view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Buscar Filmes"
        customView.delegate = self
        bindUI()
    }
}

// MARK: - BindUI
extension SearchFilmsViewController {

    func bindUI() {
        viewModel?.onFilmsFetched = { [weak self] films in
            self?.viewModel?.showListFilms(films: films)
        }

        viewModel?.onFilmsFetchedError = { err in
            print(err.localizedDescription)
        }
    }
}

// MARK: - UITextFieldDelegate
extension SearchFilmsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - SearchFilmsViewDelegate
extension SearchFilmsViewController: SearchFilmsViewDelegate {
    func didUpdateSearchText(_ text: String) {
        viewModel?.searchFilms(query: text)
    }
}
