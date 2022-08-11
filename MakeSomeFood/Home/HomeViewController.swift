import UIKit

class HomeViewController: UITableViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        tableView.separatorStyle = .none
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "OpenCategorySegue",
//            let senderCell = sender as? CategoryCell {
//            print(senderCell.categoryLabel.text)
//        }
//    }

    private func setImage() {
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 20 // как правильно сделать круглое фото здесь? 20 я просто подобрала
    }
}

extension HomeViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return categoryOfMeal.count
        default:
            fatalError()
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Сегодня готовим"
        case 1:
            return "Категории"
        default:
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            //MARK: - Где настраивать красоту для ячеек и ее содержимого? В функции или в файле TodayCookingCell?
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCookingCell", for: indexPath) as! TodayCookingCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.categoryLabel.text = categoryOfMeal[indexPath.row].nameOfCategory
            cell.categoryImage.image = categoryOfMeal[indexPath.row].imageOfCategory
            return cell
        default:
            fatalError()
        }
    }
}
