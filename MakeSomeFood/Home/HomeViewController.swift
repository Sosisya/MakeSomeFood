import UIKit

class HomeViewController: UITableViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var selectedCategory: Category?

    private struct Spec {
        static let titleTodayCooking = "Сегодня готовим"
        static let titleActionAllRecepies = "Все рецепты"
        static let titleCategory = "Категории"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TodayCookingTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayCookingTableViewCell")
    }
    
    private func setImage() {
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 21
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = segue.destination as? CategoryTableViewController,
           let selectedCategory = selectedCategory {
            destination.category = selectedCategory
        }
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
        switch section {
        case 0:
            header.configure(title: Spec.titleTodayCooking , actionTitle: Spec.titleActionAllRecepies, action: {
                print("Все рецепты")
            })
        case 1:
            header.configure(title: Spec.titleCategory)
        default:
            return nil
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCookingTableViewCell", for: indexPath) as! TodayCookingTableViewCell
            cell.cellView.hasLargeImage = true
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let item = categoryOfMeal[indexPath.row]
            cell.categoryLabel.text = item.nameOfCategory
            cell.categoryImage.image = item.imageOfCategory
            return cell
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        selectedCategory = categoryOfMeal[indexPath.row]
        performSegue(withIdentifier: "toCategory", sender: self)
    }
}
