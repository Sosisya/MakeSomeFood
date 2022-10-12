import UIKit

class RecepieViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var recepieHeader: StrechyHeader!
    var headerHeight: CGFloat = 280

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none

        recepieHeader = tableView.tableHeaderView as? StrechyHeader
        tableView.tableHeaderView = nil
        tableView.addSubview(recepieHeader)
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
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
            cell.ingredientHeaderView.headerTitle.text = "Ингредиенты"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            let item = ingredients[indexPath.row]
            cell.ingredientLabel.text = item.nameOfIngredient
            cell.amountLabel.text = item.amountOfIngredient
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionHeaderViewCell", for: indexPath) as! DescriptionHeaderViewCell
            cell.descriptionHeaderView.headerTitle.text = "Описание"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescritionOfRecepieTableViewCell", for: indexPath) as! DescritionOfRecepieTableViewCell
            cell.descriptionOfRecepie.text = "Смешайте все сухие ингредиенты: муку просейте с неполной ч.л. разрыхлителя, добавьте мелкой соли, сахара, хорошо перемешайте./Блины с таким количеством сахара получатся умеренно сладкими, с интенсивным золотистым цветом. С меньшим количеством будут бледнее, с большим - быстро румянятся и даже могут пригорать/.Если кладёте соду, её также нужно смешать с мукой и предварительно не гасить - это сделает кефир прямо в тесте.Смешайте все сухие ингредиенты: муку просейте с неполной ч.л. разрыхлителя, добавьте мелкой соли, сахара, хорошо перемешайте./Блины с таким количеством сахара получатся умеренно сладкими, с интенсивным золотистым цветом. С меньшим количеством будут бледнее, с большим - быстро румянятся и даже могут пригорать/.Если кладёте соду, её также нужно смешать с мукой и предварительно не гасить - это сделает кефир прямо в тесте.Смешайте все сухие ингредиенты: муку просейте с неполной ч.л. разрыхлителя, добавьте мелкой соли, сахара, хорошо перемешайте./Блины с таким количеством сахара получатся умеренно сладкими, с интенсивным золотистым цветом. С меньшим количеством будут бледнее, с большим - быстро румянятся и даже могут пригорать/.Если кладёте соду, её также нужно смешать с мукой и предварительно не гасить - это сделает кефир прямо в тесте.Смешайте все сухие ингредиенты: муку просейте с неполной ч.л. разрыхлителя, добавьте мелкой соли, сахара, хорошо перемешайте./Блины с таким количеством сахара получатся умеренно сладкими, с интенсивным золотистым цветом. С меньшим количеством будут бледнее, с большим - быстро румянятся и даже могут пригорать/.Если кладёте соду, её также нужно смешать с мукой и предварительно не гасить - это сделает кефир прямо в тесте."
            return cell
        default:
            fatalError()
        }
    }
//
//    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
//            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
//        switch section {
//        case 0:
//            return nil
//        case 1:
//            header.configure(title: "Ингредиенты")
//        case 2:
//            header.configure(title: "Описание")
//        default:
//            return nil
//        }
//        return header
//    }

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
        if tableView.contentOffset.y <= -headerHeight {
            recepieHeader.frame.origin.y = tableView.contentOffset.y
            recepieHeader.frame.size.height = -tableView.contentOffset.y
            recepieHeader.frame.size.width = tableView.frame.size.width
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeader()
    }

}
