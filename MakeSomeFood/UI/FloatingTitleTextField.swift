import UIKit

@IBDesignable
class FloatingTitleTextField: UIView {
    @IBInspectable var title: String = "" {
        didSet { setupViews() }
    }

    @IBInspectable var text: String = "" {
        didSet { setupViews() }
    }

    @IBInspectable var hasClearButton: Bool = false {
        didSet { setupViews() }
    }

    @IBInspectable var hasHideButton: Bool = false {
        didSet { setupViews() }
    }

    let titleLabel = UILabel()
    let textField = UITextField()
    let contentView = UIView()
    let stackView = UIStackView()
    let clearButton = UIButton()
    let hideButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.addArrangedSubview(contentView)
        stackView.addArrangedSubview(clearButton)
        stackView.addArrangedSubview(hideButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        setupConstraints()
        setupViews()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 32),
            stackView.heightAnchor.constraint(equalToConstant: 32),
            clearButton.heightAnchor.constraint(equalToConstant: 32),
            clearButton.widthAnchor.constraint(equalToConstant: 32),
            hideButton.heightAnchor.constraint(equalToConstant: 32),
            hideButton.widthAnchor.constraint(equalToConstant: 32),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }

    private func setupViews() {
        titleLabel.text = title
        textField.text = text
        clearButton.isHidden = !hasClearButton || text.isEmpty
        hideButton.isHidden = !hasHideButton
    }
}

