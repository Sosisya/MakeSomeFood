import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recipeHeader: StrechyHeader!

    var recipe: Recipe?

    private struct Spec {
        static var headerContentInsetTop: CGFloat = 280
        static var headerContentInsetLeft: CGFloat = 0
        static var headerContentInsetBottom: CGFloat = 0
        static var headerContentInsetRight: CGFloat = 0
        static var headerContentOffsetX: CGFloat = 0
        static var ingredientHeaderTitle = "Ingredients"
        static var instructionHeaderTitle = "Instructions"
        static var fontOfInstruction = UIFont(name: "Montserrat-Regular", size: 16)!
    }

    enum Section: Int, CaseIterable {
        case nameAndTags
        case ingredientsHeader
        case ingredients
        case instructionHeader
        case instruction
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none

        recipeHeader = tableView.tableHeaderView as? StrechyHeader
        tableView.tableHeaderView = nil
        tableView.addSubview(recipeHeader)
        recipeHeader.headerImageView.kf.setImage(with: URL(string: recipe?.thumb ?? ""))
        tableView.contentInset = UIEdgeInsets(top: Spec.headerContentInsetTop, left: Spec.headerContentInsetLeft, bottom: Spec.headerContentInsetBottom, right: Spec.headerContentInsetRight)
        tableView.contentOffset = CGPoint(x: 0, y: -Spec.headerContentInsetTop)
        updateHeader()
    }
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .nameAndTags:
            return 1
        case .ingredientsHeader:
            return 1
        case .ingredients:
            return recipe?.ingredients.count ?? 0
        case .instructionHeader:
            return 1
        case .instruction:
            return 1
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .nameAndTags:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameOfRecipeTableViewCell", for: indexPath) as! NameOfRecipeTableViewCell
            cell.nameOfRecipeLabel.text = recipe?.name
            cell.categoryTagLabel.text = recipe?.category
            cell.areaTagLabel.text = recipe?.area
            return cell
        case .ingredientsHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientHeaderViewCell", for: indexPath) as! IngredientHeaderViewCell
            cell.ingredientHeaderView.headerTitle.text = Spec.ingredientHeaderTitle
            return cell
        case .ingredients:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            let itemIngredients = recipe?.ingredients[indexPath.row]
            cell.ingredientLabel.text = itemIngredients
            let itemMeasure = recipe?.measures[indexPath.row]
            cell.amountLabel.text = itemMeasure
            return cell
        case .instructionHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionHeaderViewCell", for: indexPath) as! InstructionHeaderViewCell
            cell.instructionHeaderView.headerTitle.text = Spec.instructionHeaderTitle
            return cell
        case .instruction:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionOfRecipeTableViewCell", for: indexPath) as! InstructionOfRecipeTableViewCell
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.33
            cell.recipeInsctruction.attributedText = NSMutableAttributedString(string: recipe?.instruction ?? "", attributes: [.kern: -0.41, .paragraphStyle: paragraphStyle, .font: Spec.fontOfInstruction])
            return cell
        default:
            fatalError()
        }
    }

    func updateHeader() {
        if tableView.contentOffset.y <= -Spec.headerContentInsetTop {
            recipeHeader.frame.origin.y = tableView.contentOffset.y
            recipeHeader.frame.size.height = -tableView.contentOffset.y
            recipeHeader.frame.size.width = tableView.frame.size.width
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeader()
    }

}
