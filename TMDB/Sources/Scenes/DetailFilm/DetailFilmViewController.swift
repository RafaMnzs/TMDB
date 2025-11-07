import UIKit

final class DetailFilmViewController: UIViewController {
    private let customView: DetailFilmView = DetailFilmView()
    private let viewModel: DetailFilmViewModelProtocol?

    private let hideSave: Bool?
    private let hideDelete: Bool?

    init(viewModel: DetailFilmViewModelProtocol, hideSave: Bool? = false, hideDelete: Bool? = true) {
        self.viewModel = viewModel
        self.hideSave = hideSave
        self.hideDelete = hideDelete
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

        if let save = hideSave {
            if save == false {
                navigationItem.rightBarButtonItem = UIBarButtonItem(
                    title: "Salvar",
                    style: .done,
                    target: self,
                    action: #selector(saveButtonTapped)
                )
            }
        }

        if let delete = hideDelete {
            if delete == false {
                navigationItem.rightBarButtonItem = UIBarButtonItem(
                    title: "Delete",
                    style: .done,
                    target: self,
                    action: #selector(deleteButtonTapped)
                )
            }
        }

        searchFilms()
        bindUI()
    }

    private func searchFilms() {
        viewModel?.searchFilms()
    }

    @objc private func saveButtonTapped() {
        viewModel?.save()
    }

    @objc private func deleteButtonTapped() {
        viewModel?.delete()
        navigationController?.popViewController(animated: true)
    }
}

extension DetailFilmViewController {
    func bindUI() {
        viewModel?.onFilmFetched = { [weak self] film in
            self?.title = film.title
            self?.customView.settings(with: film)
        }

        viewModel?.onFilmFetchedError = { error in
            print(error.localizedDescription)
        }
    }
}
