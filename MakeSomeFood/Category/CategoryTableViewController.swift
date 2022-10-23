import UIKit

class CategoryTableViewController: UITableViewController, RecipePresenting {

    var category: Category!

    private struct Spec {
        static var fontOfHeaderFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
    }

    enum Section: Int, CaseIterable {
        case recipeOfCategory
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = category.category
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.fontOfHeaderFont]
        tableView.register(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialTableViewCell")
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .recipeOfCategory:
            return selectedCategoryRecepies.count
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .recipeOfCategory:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as! SpecialTableViewCell
            let item = selectedCategoryRecepies[indexPath.row]
            cell.cellView.nameOfMeal.text = item.nameOfMeal
            cell.cellView.coverImageView.image = item.image
            cell.cellView.areaTagLabel.text = item.areaTagLabel
            cell.cellView.categoryTagLabel.text = item.categoryTagLabel
            cell.cellView.setIsFavourite(false)
            cell.cellView.hasLargeImage = false
            return cell
        default:
            fatalError()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showRecepie(recepie)
    }
}
