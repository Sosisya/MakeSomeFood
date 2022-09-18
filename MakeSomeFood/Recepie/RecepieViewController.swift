import UIKit

class RecepieViewController: UIViewController {
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.cornerRadius = 12

        tableView.dataSource = self
        tableView.delegate = self

        tableView.separatorStyle = .none

        tableView.register(IngredientsForRecepieTableViewCell.self, forCellReuseIdentifier: "IngredientsForRecepieTableViewCell")
        tableView.register(DescriptionOfRecepieTableViewCell.self, forCellReuseIdentifier: "DescriptionOfRecepieTableViewCell")
        tableView.register(NameOfPecepieTableViewCell.self, forCellReuseIdentifier: "NameOfPecepieTableViewCell")
    }
}

extension UIViewController: UITableViewDelegate, UITableViewDataSource {

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
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameOfPecepieTableViewCell", for: indexPath) as! NameOfPecepieTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            //            let item = categoryOfMeal[indexPath.row]
            //            cell.categoryLabel.text = item.nameOfCategory
            //            cell.categoryImage.image = item.imageOfCategory
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionOfRecepieTableViewCell", for: indexPath) as! DescriptionOfRecepieTableViewCell
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
