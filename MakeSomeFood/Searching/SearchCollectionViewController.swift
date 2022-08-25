import UIKit

class SearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "SearchingViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchingViewCell")
        collectionView.register(UINib(nibName: "SearchAllRecepiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchAllRecepiesCollectionViewCell")

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
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
            return 1
        default:
            fatalError()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = categoryTags[indexPath.row]
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = areaTags[indexPath.row]
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
            cell.tagLabel.text = ingredientTags[indexPath.row]
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchAllRecepiesCollectionViewCell", for: indexPath) as! SearchAllRecepiesCollectionViewCell
            return cell
        default:
            fatalError()
        }
    }

//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
//            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
//        switch section {
//        case 0:
//            header.configure(title: "Сегодня готовим", actionTitle: "Все рецепты", action: {
//                print("Все рецепты")
//            })
//        case 1:
//            header.configure(title: "Категории")
//        default:
//            return nil
//        }
//        return header
//    }
}
