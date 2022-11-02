import UIKit

enum TagsType {
    case category
    case area
    case ingredient

    var color: UIColor {
        switch self {
        case .category: return UIColor(named: "orange")!
        case .area: return UIColor(named: "green")!
        case .ingredient: return UIColor(named: "orange")!
        }
    }
}

class AllChipsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var tagsType: TagsType?
    private var tags: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "SearchingViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchingViewCell")
        collectionView.register(UINib(nibName: "CollectionSectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionSectionHeaderView")
        switch tagsType {
        case .category:
            ApiManager.getTagsOfCategories { [weak self] result in
                switch result {
                case .success(let categoriesTagsList):
                    DispatchQueue.main.async {
                        self?.tags = categoriesTagsList.meals.map { $0.category }
                        self?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case .area:
            ApiManager.getTagsOfArea { [weak self] result in
                switch result {
                case .success(let areaTagsList):
                    DispatchQueue.main.async {
                        self?.tags = areaTagsList.meals.map { $0.area }
                        self?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case .ingredient:
            ApiManager.getTagsOfIngredients { [weak self] result in
                switch result {
                case .success(let ingredientsTagsList):
                    DispatchQueue.main.async {
                        self?.tags = ingredientsTagsList.meals.map { $0.ingredient }
                        self?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default:
            break
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionSectionHeaderView", for: indexPath) as! CollectionSectionHeaderView
            header.configure(title: "All categories")
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
        let item = tags[indexPath.row]
        cell.tagLabel.text = item
        cell.backgroundColor = tagsType?.color
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 42)
    }
}
