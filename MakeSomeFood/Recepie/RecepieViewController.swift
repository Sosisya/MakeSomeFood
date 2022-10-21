import UIKit

class RecepieViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recepieHeader: StrechyHeader!

    var recepie: ToodayCooking?

    private struct Spec {
        static var headerHeight: CGFloat = 280
        static var ingredientHeaderTitle = "Ингредиенты"
        static var descritionHeaderTitle = "Описание"
    }

    enum Section: Int, CaseIterable {
        case nameAndTags
        case ingredientsHeader
        case ingredients
        case descriptionHeader
        case description
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none

        recepieHeader = tableView.tableHeaderView as? StrechyHeader
        tableView.tableHeaderView = nil
        tableView.addSubview(recepieHeader)
        tableView.contentInset = UIEdgeInsets(top: Spec.headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -Spec.headerHeight)
        updateHeader()

 
    }
}

extension RecepieViewController: UITableViewDelegate, UITableViewDataSource {

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
            return recepie?.ingredients.count ?? 0
        case .descriptionHeader:
            return 1
        case .description:
            return 1
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .nameAndTags:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameOfRecepieTableViewCell", for: indexPath) as! NameOfRecepieTableViewCell
            cell.nameOfRecepieLabel.text = recepie?.name
            cell.categoryTagLabel.text = recepie?.category
            cell.areaTagLabel.text = recepie?.area
            return cell
        case .ingredientsHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientHeaderViewCell", for: indexPath) as! IngredientHeaderViewCell
            cell.ingredientHeaderView.headerTitle.text = Spec.ingredientHeaderTitle
            return cell
        case .ingredients:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            let itemIngredients = recepie?.ingredients[indexPath.row]
            cell.ingredientLabel.text = itemIngredients
            let itemMeasure = recepie?.measures[indexPath.row]
            cell.amountLabel.text = itemMeasure
            return cell
        case .descriptionHeader:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionHeaderViewCell", for: indexPath) as! DescriptionHeaderViewCell
            cell.descriptionHeaderView.headerTitle.text = Spec.descritionHeaderTitle
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescritionOfRecepieTableViewCell", for: indexPath) as! DescritionOfRecepieTableViewCell
            cell.descriptionOfRecepie.text = recepie?.instruction
            return cell
        default:
            fatalError()
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0.01
        case 1:
            return UITableView.automaticDimension
        case 2:
            return UITableView.automaticDimension
        default:
            return 0.01
        }
    }

    func updateHeader() {
        if tableView.contentOffset.y <= -Spec.headerHeight {
            recepieHeader.frame.origin.y = tableView.contentOffset.y
            recepieHeader.frame.size.height = -tableView.contentOffset.y
            recepieHeader.frame.size.width = tableView.frame.size.width
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeader()
    }

}
