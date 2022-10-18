import UIKit

class SearchCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private struct Spec {
        static let titleOfCategory = "Категории"
        static let titleOfKitchen = "Кухня"
        static let titleOfIngredient = "Ингредиенты"
        static let titleOfAllRecepies = "Все рецепты"
        static let colorOfTagOrange = UIColor(named: "orange")
        static let colorOfTagsGreen = UIColor(named: "green")
    }

    enum Section: Int, CaseIterable {
        case category
        case kitchen
        case ingredient
        case allRecepies
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "SearchingViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchingViewCell")
        collectionView.register(UINib(nibName: "SearchAllRecepiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchAllRecepiesCollectionViewCell")
        collectionView.register(UINib(nibName: "CollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionSectionHeaderView")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionSectionHeaderView", for: indexPath) as! CollectionSectionHeaderView
        switch Section(rawValue: indexPath.section) {
        case .category:
            header.configure(title: Spec.titleOfCategory)
        case .kitchen:
            header.configure(title: Spec.titleOfKitchen)
        case .ingredient:
            header.configure(title: Spec.titleOfIngredient)
        case .allRecepies:
            header.configure(title: Spec.titleOfAllRecepies, offset: 16)
        default:
            break
        }
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch Section(rawValue: section) {
        case .category:
            return categoryTags.count
        case .kitchen:
            return areaTags.count
        case .ingredient:
            return ingredientTags.count
        case .allRecepies:
            return 3
        default:
            fatalError()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 42)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch Section(rawValue: indexPath.section) {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = categoryTags[indexPath.row]
            cell.backgroundColor = Spec.colorOfTagOrange
            return cell
        case .kitchen:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = areaTags[indexPath.row]
            cell.backgroundColor = Spec.colorOfTagsGreen

            return cell
        case .ingredient:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = ingredientTags[indexPath.row]
            cell.backgroundColor = Spec.colorOfTagOrange
            return cell
        case .allRecepies:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchAllRecepiesCollectionViewCell", for: indexPath) as! SearchAllRecepiesCollectionViewCell
            return cell
        default:
            fatalError()
        }
    }
}
