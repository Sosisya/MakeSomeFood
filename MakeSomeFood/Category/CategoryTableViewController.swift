import UIKit

class CategoryTableViewController: UITableViewController, RecipePresenting {

    var category: Category!
    private var recipe: Recipe!

    private struct Spec {
        static var fontOfHeaderFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return selectedCategoryRecepies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as! SpecialTableViewCell
            let item = selectedCategoryRecepies[indexPath.row]
            cell.cellView.nameOfMeal.text = item.nameOfMeal
            cell.cellView.coverImageView.image = item.image
            cell.cellView.areaTagLabel.text = item.areaTagLabel
            cell.cellView.categoryTagLabel.text = item.categoryTagLabel
            cell.cellView.setIsFavourite(false)
            cell.cellView.hasLargeImage = false
            return cell
    }

//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            showRecipe(recipe)
//        }
}
