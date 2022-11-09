import UIKit

class SearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, RecipePresenting {

    private var categoriesTag: [CategoryTag] = []
    private var areasTag: [AreaTag] = []
    private var ingredietsTag: [IngredientTag] = []
    private var recipe: [Recipe] = []

    private var recipes: Recipe?

    private struct Spec {
        static var titleOfCategory = "Categories"
        static var titleOfArea = "Area"
        static var titleOfIngredient = "Ingredients"
        static var titleOfAllCategories = TagsType.category.title
        static var titleOfAllAreas = TagsType.area.title
        static var titleOfAllIngridients = TagsType.ingredient.title
        static var titleOfAllRecipes = "All recipes"
        static var colorOfTagOrange = UIColor(named: "orange")
        static var colorOfTagsGreen = UIColor(named: "green")
        static var headerTitleOfAllRecipesOffset: CGFloat = 16
        static var collectionViewLayoutHeight: CGFloat = 42
        static var countOfTags = 6
    }

    enum Section: Int, CaseIterable {
        case category
        case area
        case ingredient
        case allRecipes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "SearchingViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchingViewCell")
        collectionView.register(UINib(nibName: "SearchAllRecipesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchAllRecipesCollectionViewCell")
        collectionView.register(UINib(nibName: "CollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionSectionHeaderView")

        ApiManager.getTagsOfCategories { [weak self] result in
            switch result {
            case .success(let categoriesTagsList):
                DispatchQueue.main.async {
                    self?.categoriesTag = categoriesTagsList.meals
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        ApiManager.getTagsOfArea { [weak self] result in
            switch result {
            case .success(let areasTagsList):
                DispatchQueue.main.async {
                    self?.areasTag = areasTagsList.meals
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        ApiManager.getTagsOfIngredients { [weak self] result in
            switch result {
            case .success(let ingredientsTagsList):
                DispatchQueue.main.async {
                    self?.ingredietsTag = ingredientsTagsList.meals
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        ApiManager.getAllRecipes { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.recipe = recipes.meals
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        ApiManager.getRecipe { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.recipes = recipes.meals.first
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionSectionHeaderView", for: indexPath) as! CollectionSectionHeaderView
        switch Section(rawValue: indexPath.section) {
        case .category:
            header.configure(title: Spec.titleOfCategory, actionTitle: Spec.titleOfAllCategories) { [weak self] in
                self?.showAllTags(.category)
            }
        case .area:
            header.configure(title: Spec.titleOfArea, actionTitle: Spec.titleOfAllAreas) { [weak self] in
                self?.showAllTags(.area)
            }
        case .ingredient:
            header.configure(title: Spec.titleOfIngredient, actionTitle: Spec.titleOfAllIngridients) { [weak self] in
                self?.showAllTags(.ingredient)
            }
        case .allRecipes:
            header.configure(title: Spec.titleOfAllRecipes, offset: Spec.headerTitleOfAllRecipesOffset)
        default:
            break
        }
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch Section(rawValue: section) {
        case .category:
            return min(categoriesTag.count, Spec.countOfTags)
        case .area:
            return min(areasTag.count, Spec.countOfTags)
        case .ingredient:
            return min(ingredietsTag.count, Spec.countOfTags)
        case .allRecipes:
            return recipe.count
        default:
            fatalError()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: Spec.collectionViewLayoutHeight)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            let item = categoriesTag[indexPath.row]
            cell.tagLabel.text = item.category
            cell.backgroundColor = Spec.colorOfTagOrange
            return cell
        case .area:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            let item = areasTag[indexPath.row]
            cell.tagLabel.text = item.area
            cell.backgroundColor = Spec.colorOfTagsGreen
            return cell
        case .ingredient:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            let item = ingredietsTag[indexPath.row]
            cell.tagLabel.text = item.ingredient
            cell.backgroundColor = Spec.colorOfTagOrange
            return cell
        case .allRecipes:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchAllRecipesCollectionViewCell", for: indexPath) as! SearchAllRecipesCollectionViewCell
            let item = recipe[indexPath.row]
            cell.searchingView.hasLargeImage = true
            cell.searchingView.areaTagLabel.text = item.area
            cell.searchingView.categoryTagLabel.text = item.category
            cell.searchingView.nameOfMeal.text = item.name
            cell.searchingView.coverImageView.kf.setImage(with: URL(string: item.thumb ?? ""))
            return cell
        default:
            fatalError()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section) {
        case  .allRecipes:
            let item = recipe[indexPath.row]
            showRecipe(item)
        default:
            break
        }



    }

    func showAllTags(_ tag: TagsType) {
        let allTagsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllChipsCollectionViewController") as! AllChipsCollectionViewController
        allTagsVC.tagsType = tag
        show(allTagsVC, sender: self)
    }
}
