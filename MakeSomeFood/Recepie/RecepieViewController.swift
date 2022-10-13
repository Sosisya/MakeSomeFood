import UIKit

class RecepieViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recepieHeader: StrechyHeader!

    private struct Spec {
        static var headerHeight: CGFloat = 280
        static var ingredientHeaderTitle = "Ингредиенты"
        static var descritionHeaderTitle = "Описание"
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
        return 5
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return ingredients.count
        case 3:
            return 1
        case 4:
            return 1
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameOfRecepieTableViewCell", for: indexPath) as! NameOfRecepieTableViewCell
            cell.nameOfRecepieLabel.text = nameAndTags.nameOfRecepie
            cell.categoryTagLabel.text = nameAndTags.categoryTagLabel
            cell.areaTagLabel.text = nameAndTags.areaTagLabel
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientHeaderViewCell", for: indexPath) as! IngredientHeaderViewCell
            cell.ingredientHeaderView.headerTitle.text = Spec.ingredientHeaderTitle
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            let item = ingredients[indexPath.row]
            cell.ingredientLabel.text = item.nameOfIngredient
            cell.amountLabel.text = item.amountOfIngredient
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionHeaderViewCell", for: indexPath) as! DescriptionHeaderViewCell
            cell.descriptionHeaderView.headerTitle.text = Spec.descritionHeaderTitle
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescritionOfRecepieTableViewCell", for: indexPath) as! DescritionOfRecepieTableViewCell
            cell.descriptionOfRecepie.text = description
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
