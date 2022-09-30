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
    let contentStackView = UIStackView()
    let stackView = UIStackView()
    let clearButton = UIButton()
    let hideButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    private func commonInit() {
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 6
        contentStackView.axis = .vertical
        contentStackView.spacing = 0
        stackView.addArrangedSubview(contentStackView)
        stackView.addArrangedSubview(clearButton)
        stackView.addArrangedSubview(hideButton)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(textField)
        setupConstraints()
        setupViews()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.heightAnchor.constraint(equalToConstant: 32),
            clearButton.heightAnchor.constraint(equalToConstant: 32),
            clearButton.widthAnchor.constraint(equalToConstant: 32),
            hideButton.heightAnchor.constraint(equalToConstant: 32),
            hideButton.widthAnchor.constraint(equalToConstant: 32),
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = CGRect(x: 12, y: 0, width: bounds.width - 24, height: bounds.height)
    }

    private func setupViews() {
        titleLabel.text = title
        textField.text = text
        clearButton.isHidden = !hasClearButton || text.isEmpty
        hideButton.isHidden = !hasHideButton
        clearButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        hideButton.setImage(UIImage(systemName: "eye"), for: .normal)
    }
}
