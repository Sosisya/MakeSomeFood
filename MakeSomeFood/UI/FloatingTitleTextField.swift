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

        clearButton.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        hideButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        textField.addTarget(self, action: #selector(showCloseButton(textField:)), for: .editingChanged)
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
            contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
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
        titleLabel.font = UIFont(name: "SFProText-Regular", size: 10) //почему без строчки 76 не срабатывает size из этой строчки??
        titleLabel.font = titleLabel.font.withSize(10)
        titleLabel.textColor = UIColor(named: "darkGray")

        textField.text = text
        textField.font = UIFont(name: "SFProText-Regular", size: 5) //почему не срабатывает size из этой строчки??
        textField.textColor = UIColor(named: "black")

        clearButton.isHidden = !hasClearButton || text.isEmpty
        hideButton.isHidden = !hasHideButton

        clearButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        clearButton.tintColor = UIColor(named: "darkGray")
        hideButton.setImage(UIImage(systemName: "eye"), for: .normal)
        hideButton.setTitleColor(UIColor(named: "darkGray"), for: .normal)
        hideButton.tintColor = UIColor(named: "darkGray")

        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 12
    }

    @objc func clearTextField() {
       textField.text = ""
    }

    @objc func hidePassword() {
        let isSecureTextEntry = textField.isSecureTextEntry
        textField.isSecureTextEntry = isSecureTextEntry ? false : true
        if textField.isSecureTextEntry == true {
            hideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            hideButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }

    @objc func showCloseButton(textField: UITextField) {
        if textField.text == "" {
            clearButton.isHidden = true
        } else {
            clearButton.isHidden = false
        }
    }
}
