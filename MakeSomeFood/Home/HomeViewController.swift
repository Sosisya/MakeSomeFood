import UIKit
import Kingfisher

class HomeViewController: UITableViewController, RecipePresenting {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var selectedCategory: Category?
    private var categories: [Category] = []

    private var recipe: Recipe?

    private struct Spec {
        static var titleSpecial = "Special"
        static var titleActionAllRecipes = "All recipes"
        static var titleCategory = "Categories"
        static var profileImageCornerRadius: CGFloat = 12
        static var countOfCellWithoutRecipe = 0
        static var countOfCellWithRecipe = 1
    }

    enum Section: Int, CaseIterable {
        case special
        case allCategories
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialTableViewCell")
        
        ApiManager.getCategories { [weak self] result in
            switch result {
            case .success(let categoriesList):
                DispatchQueue.main.async {
                    self?.categories = categoriesList.categories
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        ApiManager.getRecipe { [weak self] result in
            switch result {
            case .success(let recepieList):
                DispatchQueue.main.async {
                    self?.recipe = recepieList.meals.first
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setImage() {
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = Spec.profileImageCornerRadius
    }
}

extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .special:
            return recipe == nil ? Spec.countOfCellWithoutRecipe : Spec.countOfCellWithRecipe
        case .allCategories:
            return categories.count
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
        //        let header = TableSectionHeaderView.f_loadInstanceFromNib()
        switch Section(rawValue: section) {
        case .special:
            header.configure(title: Spec.titleSpecial , actionTitle: Spec.titleActionAllRecipes) { [weak self] in
                self?.showAllRecipes()
            }
        case .allCategories:
            header.configure(title: Spec.titleCategory)
        default:
            return nil
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .special:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as! SpecialTableViewCell
            cell.cellView.hasLargeImage = true
            cell.cellView.areaTagLabel.text = recipe?.area
            cell.cellView.categoryTagLabel.text = recipe?.category
            cell.cellView.nameOfMeal.text = recipe?.name
            cell.cellView.coverImageView.kf.setImage(with: URL(string: recipe?.thumb ?? ""))
            return cell
        case .allCategories:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let item = categories[indexPath.row]
            cell.categoryLabel.text = item.category
            let url = URL(string: item.thumb)
            cell.categoryImage.kf.setImage(with: url)
            return cell
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section) {
        case .special:
            guard let recipe = recipe else { return }
            showRecipe(recipe)
        case .allCategories:
            guard indexPath.section == 1 else { return }
            showRecipes(.category, categories[indexPath.row].category)
        default:
            break
        }
    }

    func showAllRecipes() {
        let allRecipesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllRecipesTableViewController") as! AllRecipesTableViewController
        show(allRecipesVC, sender: self)
    }
}
