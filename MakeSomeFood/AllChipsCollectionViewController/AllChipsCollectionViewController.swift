import UIKit

class AllChipsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var tagsType: TagsType?
    private var tags: [String] = []
    var selectedTag: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = tagsType?.title
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-SemiBold", size: 24)!]

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

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedTag = tags[indexPath.row]
        performSegue(withIdentifier: "toTags", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch tagsType {
        case .category:
            if let destination = segue.destination as? CategoryTableViewController,
               let selectedTag = selectedTag {
                destination.category = selectedTag
                destination.tagsType = .category
            }
        case .area:
            if let destination = segue.destination as? CategoryTableViewController,
               let selectedTag = selectedTag {
                destination.category = selectedTag
                destination.tagsType = .area
            }
        case .ingredient:
            if let destination = segue.destination as? CategoryTableViewController,
               let selectedTag = selectedTag {
                destination.category = selectedTag
                destination.tagsType = .ingredient
            }
        default:
            break
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 42)
    }
}
