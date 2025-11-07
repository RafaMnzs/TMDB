import UIKit

final class SavedFilmsViewController: UIViewController {

    private let customView: SavedFilmsView = SavedFilmsView()

    private var viewModel: SavedFilmsViewModelProtocol?

    init(viewModel: SavedFilmsViewModelProtocol) {
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
        title = "Favoritos"
        customView.delegate = self
        bindUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.fetchAllSavedFilms()
    }
}

// MARK: - BindUI
extension SavedFilmsViewController {
    func bindUI() {
        viewModel?.onFilmsFetched = { [weak self] films in
            self?.customView.settings(itens: films)
        }

        viewModel?.onFilmsFetchedError = { err in
            print(err.localizedDescription)
        }
    }
}

//MARK: - SavedFilmsViewDelegate
extension SavedFilmsViewController: SavedFilmsViewDelegate {
    func filmSelected(_ film: Film) {
        viewModel?.showDetails(for: film)
    }
}
