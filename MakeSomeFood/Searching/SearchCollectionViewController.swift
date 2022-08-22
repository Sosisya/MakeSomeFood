//import UIKit
//
//private let reuseIdentifier = "Cell"
//
//class SearchCollectionViewController: UICollectionViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 3
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        switch section {
//        case 0:
//            return 1
//        case 1:
//            return 1
//        case 2:
//            return 1
//        default:
//            fatalError()
//        }
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        switch indexPath.section {
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCategoryCell", for: indexPath) as! SearchCategoryCell
//            cell.categiryTagButton.setTitle(search[indexPath.row].categoryButton, for: .normal)
//            return cell
//        case 1:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchAreaCell", for: indexPath) as! SearchAreaCell
//            cell.areaTagButton.setTitle(search[indexPath.row].areaButton, for: .normal)
//            return cell
//        case 2:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchAllRecepies", for: indexPath) as! SearchAllRecepies
//            let cellView = UINib(nibName: "CellView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CellView
//            cell.contentView.addSubview(cellView)
//            return cell
//        default:
//            fatalError()
//        }
//    }
//
////    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
////            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
////        switch section {
////        case 0:
////            header.configure(title: "Сегодня готовим", actionTitle: "Все рецепты", action: {
////                print("Все рецепты")
////            })
////        case 1:
////            header.configure(title: "Категории")
////        default:
////            return nil
////        }
////        return header
////    }
//
//
//}
