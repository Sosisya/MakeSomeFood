import UIKit

class AllRecipesTableViewController: UITableViewController, RecipePresenting {

    private var recipe: [Recipe] = []

    private struct Spec {
        static var titleOfHeader = "All recipes"
        static var fontOfHeaderFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Spec.titleOfHeader
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.fontOfHeaderFont]
        tableView.register(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialTableViewCell")
        tableView.separatorStyle = .none

        ApiManager.getAllRecipes { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.recipe = recipes.meals
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as! SpecialTableViewCell
        let item = recipe[indexPath.row]
        cell.cellView.nameOfMeal.text = item.name
        cell.cellView.coverImageView.kf.setImage(with: URL(string: item.thumb ?? ""))
        cell.cellView.categoryTagLabel.text = item.category
        cell.cellView.areaTagLabel.text = item.area
        cell.cellView.setIsFavourite(false)
        cell.cellView.hasLargeImage = false
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = recipe[indexPath.row]
        showRecipe(item)
    }
}

