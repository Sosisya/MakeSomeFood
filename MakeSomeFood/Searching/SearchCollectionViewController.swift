import UIKit

class SearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private var categoriesTag: [CategoryTag] = []
    private var areasTag: [AreaTag] = []
    private var ingredietsTag: [IngredientTag] = []

    private struct Spec {
        static var titleOfCategory = "Categories"
        static var titleOfArea = "Area"
        static var titleOfIngredient = "Ingredients"
        static var titleOfAllRecipes = "All recipes"
        static var colorOfTagOrange = UIColor(named: "orange")
        static var colorOfTagsGreen = UIColor(named: "green")
        static var headerTitleOfAllRecipesOffset: CGFloat = 16
        static var collectionViewLayoutHeight: CGFloat = 42
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
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionSectionHeaderView", for: indexPath) as! CollectionSectionHeaderView
        switch Section(rawValue: indexPath.section) {
        case .category:
            header.configure(title: Spec.titleOfCategory, actionTitle: "All categories")
        case .area:
            header.configure(title: Spec.titleOfArea, actionTitle: "All areas")
        case .ingredient:
            header.configure(title: Spec.titleOfIngredient, actionTitle: "All ingredients" )
        case .allRecipes:
            header.configure(title: Spec.titleOfAllRecipes, actionTitle: "", offset: Spec.headerTitleOfAllRecipesOffset)
        default:
            break
        }
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch Section(rawValue: section) {
        case .category:
            return categoriesTag.count
        case .area:
            return areasTag.count
        case .ingredient:
            return ingredietsTag.count
        case .allRecipes:
            return 3
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
            return cell
        default:
            fatalError()
        }
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showRecepie(recepie)
//    }
}
