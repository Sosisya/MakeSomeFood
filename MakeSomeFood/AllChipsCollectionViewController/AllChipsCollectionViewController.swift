import UIKit

class AllChipsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var tagsOfCategories: CategoryTag?

    private var categoriesTag: [CategoryTag] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "SearchingViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchingViewCell")
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
        return categoriesTag.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchingViewCell", for: indexPath) as! SearchingViewCell
        let item = categoriesTag[indexPath.row]
        cell.tagLabel.text = item.category
        cell.backgroundColor = UIColor(named: "orange")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 42)
    }
}
