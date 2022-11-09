import UIKit
import Kingfisher

class CategoryTableViewController: UITableViewController, RecipePresenting {

    var tagsType: TagsType!
    var category:  String!
    private var recipeOfCategory: [RecipeOfCategory] = []

    private struct Spec {
        static var fontOfHeaderFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = category
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.fontOfHeaderFont]
        tableView.register(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialTableViewCell")
        tableView.separatorStyle = .none

        ApiManager.getRecipes(filterId: tagsType.filterId, value: category){ [weak self] result in
            switch result {
            case .success(let recipesOfCategoryList):
                DispatchQueue.main.async {
                    self?.recipeOfCategory = recipesOfCategoryList.meals
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
        return recipeOfCategory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as! SpecialTableViewCell
        let item = recipeOfCategory[indexPath.row]
        cell.cellView.nameOfMeal.text = item.name
        cell.cellView.coverImageView.kf.setImage(with: URL(string: item.thumb))
        cell.cellView.tagsStackView.isHidden = true
        cell.cellView.setIsFavourite(false)
        cell.cellView.hasLargeImage = false
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = recipeOfCategory[indexPath.row]

        ApiManager.getRecipeById(id: item.id){ [weak self] result in
            switch result {
            case .success(let recipesOfCategoryList):
                DispatchQueue.main.async {
                    guard let recipe = recipesOfCategoryList.meals.first else { return }
                    self?.showRecipe(recipe)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
