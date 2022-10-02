import UIKit

class RecepieViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let headerView = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250))
        headerView.imageView.image = UIImage(named: "бургер")
       tableView.tableHeaderView = headerView

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
}

extension RecepieViewController: UITableViewDelegate, UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 1
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameOfRecepieTableViewCell", for: indexPath) as! NameOfRecepieTableViewCell
            let item = someRecepie[indexPath.row]
            cell.nameOfRecepieLabel.text = item.nameOfRecepie
            cell.categoryTagLabel.text = item.categoryTagLabel
            cell.areaTagLabel.text = item.areaTagLabel
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            let item = someRecepie[indexPath.row]
            cell.ingredientLabel.text = item.nameOfIngredient
            cell.amountLabel.text = item.amountOfIngredient
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescritionOfRecepieTableViewCell", for: indexPath) as! DescritionOfRecepieTableViewCell
            let item = someRecepie[indexPath.row]
            cell.descriptionOfRecepie.text = item.descriptionOfRecepie
            return cell
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
        switch section {
        case 0:
            header.configure(title:  "")
        case 1:
            header.configure(title: "Ингредиенты")
        case 2:
            header.configure(title: "Описание")
        default:
            return nil
        }
        return header
    }
}

extension RecepieViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableView.tableHeaderView as! StretchyTableHeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
}
