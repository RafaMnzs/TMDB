import UIKit

protocol SearchFilmsViewDelegate: AnyObject {
    func didUpdateSearchText(_ text: String)
}

public final class SearchFilmsView: UIView, ViewCode {

    weak var delegate: SearchFilmsViewDelegate?

    private lazy var containerView: UIView = {
        let _view = UIView()
        _view.translatesAutoresizingMaskIntoConstraints = false
        return _view
    }()

    private lazy var searchBar: UITextField = {
        let _textField = UITextField()
        _textField.placeholder = "Digite o nome do filme"
        _textField.delegate = self
        _textField.translatesAutoresizingMaskIntoConstraints = false
        return _textField
    }()

    private lazy var searchBtn: UIButton = {
        let _button = UIButton()
        _button.setTitle("Buscar", for: .normal)
        _button.backgroundColor = .systemBlue
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.layer.cornerRadius = 10
        _button.layer.masksToBounds = true
        _button.layer.borderWidth = 1
        _button.layer.borderColor = UIColor.lightGray.cgColor
        return _button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        searchBar.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        searchBtn.addTarget(self, action: #selector(sendTextFromSearchBar), for: .touchUpInside)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func textFieldDidChange() {
        let text = searchBar.text ?? ""
        let hasText = !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        searchBtn.isEnabled = hasText
        searchBtn.backgroundColor = hasText ? .systemBlue : .systemGray
    }

    @objc private func sendTextFromSearchBar() {
        let text = searchBar.text ?? ""
        delegate?.didUpdateSearchText(text)
    }
}

// MARK: - ViewCode Method
extension SearchFilmsView {
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(searchBar)
        containerView.addSubview(searchBtn)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 60),

            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            searchBar.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            searchBtn.widthAnchor.constraint(equalToConstant: 80),
            searchBtn.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 12),
            searchBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            searchBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .white
        searchBtn.isEnabled = false
        searchBtn.backgroundColor = .systemGray
    }
}

//MARK: - UITextFieldDelegate
extension SearchFilmsView: UITextFieldDelegate {}
