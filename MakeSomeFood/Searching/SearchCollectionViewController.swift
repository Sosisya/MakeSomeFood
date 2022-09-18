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

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "SearchingViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchingViewCell")
        collectionView.register(UINib(nibName: "SearchAllRecepiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchAllRecepiesCollectionViewCell")
        collectionView.register(UINib(nibName: "CollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionSectionHeaderView")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionSectionHeaderView", for: indexPath) as! CollectionSectionHeaderView
        switch indexPath.section {
        case 0:
            header.configure(title: Spec.titleOfCategory)
        case 1:
            header.configure(title: Spec.titleOfKitchen)
        case 2:
            header.configure(title: Spec.titleOfIngredient)
        case 3:
            header.configure(title: Spec.titleOfAllRecepies, offset: 16)
        default:
            break
        }
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch section {
        case 0:
            return categoryTags.count
        case 1:
            return areaTags.count
        case 2:
            return ingredientTags.count
        case 3:
            return 2
        default:
            fatalError()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 42)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = categoryTags[indexPath.row]
            cell.backgroundColor = Spec.colorOfTagOrange
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = areaTags[indexPath.row]
            cell.backgroundColor = Spec.colorOfTagsGreen

            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = ingredientTags[indexPath.row]
            cell.backgroundColor = Spec.colorOfTagOrange
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchAllRecepiesCollectionViewCell", for: indexPath) as! SearchAllRecepiesCollectionViewCell
            return cell
        default:
            fatalError()
        }
    }
}
