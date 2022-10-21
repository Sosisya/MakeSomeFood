import UIKit

@IBDesignable
class FloatingTitleTextField: UIView {

    private struct Spec {
        static var emptyTitle = ""

        static var titleLabelFont = UIFont(name: "SFProText-Regular", size: 10)
        static var titleLabelColor = UIColor(named: "darkGray")

        static var textFieldFont = UIFont(name: "SFProText-Regular", size: 5)
        static var textFieldColor = UIColor(named: "black")
        static var textFieldBorderWidth: CGFloat = 1
        static var textFieldBorderColor = UIColor(named: "black")?.cgColor
        static var textFieldCornerRadius: CGFloat = 12

        static var clearButtonIcon = UIImage(systemName: "xmark.circle")
        static var clearButtonColor = UIColor(named: "darkGray")

        static var hideOnIcon = UIImage(systemName: "eye.slash")!
        static var hideOffIcon = UIImage(systemName: "eye")!
        static var hideButtonColor = UIColor(named: "darkGray")

    }

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
        titleLabel.font = UIFont(name: "SFProText-Regular", size: 10)
        titleLabel.font = titleLabel.font.withSize(10)
        titleLabel.textColor = Spec.titleLabelColor

        textField.text = text
        textField.font = UIFont(name: "SFProText-Regular", size: 15)
        textField.textColor = Spec.textFieldColor
        textField.isSecureTextEntry = hasHideButton

        clearButton.isHidden = !hasClearButton || text.isEmpty
        hideButton.isHidden = !hasHideButton

        clearButton.setImage(Spec.clearButtonIcon, for: .normal)
        clearButton.tintColor = Spec.clearButtonColor
        hideButton.setImage(Spec.hideOnIcon, for: .normal)
        hideButton.setTitleColor(Spec.hideButtonColor, for: .normal)
        hideButton.tintColor = Spec.hideButtonColor

        layer.borderWidth = Spec.textFieldBorderWidth
        layer.borderColor = Spec.textFieldBorderColor
        layer.cornerRadius = Spec.textFieldCornerRadius
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func clearTextField() {
        textField.text = ""
    }

    @objc func hidePassword() {
        textField.isSecureTextEntry.toggle()
        let hideIcon = textField.isSecureTextEntry ? Spec.hideOnIcon : Spec.hideOffIcon
        hideButton.setImage(hideIcon, for: .normal)
    }

    @objc func showCloseButton(textField: UITextField) {
        guard hasClearButton else { return }
        clearButton.isHidden = textField.text?.isEmpty ?? true
    }

    @objc private func textFieldDidChange() {
        guard textField.text != text else { return }
        text = textField.text ?? ""
    }
}
