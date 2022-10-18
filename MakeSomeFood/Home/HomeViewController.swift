import UIKit

class HomeViewController: UITableViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var selectedCategory: Category?
    private var categories: [Category] = []

    private struct Spec {
        static let titleTodayCooking = "Сегодня готовим"
        static let titleActionAllRecepies = "Все рецепты"
        static let titleCategory = "Категории"
        static let profileImageCornerRadius: CGFloat = 12
    }

    enum Section: Int, CaseIterable {
        case todayCooking
        case allCategories
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TodayCookingTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayCookingTableViewCell")
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
    }
    
    private func setImage() {
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = Spec.profileImageCornerRadius
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = segue.destination as? CategoryTableViewController,
           let selectedCategory = selectedCategory {
            destination.category = selectedCategory
        }
    }
}

extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .todayCooking:
            return 1
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
        case .todayCooking:
            header.configure(title: Spec.titleTodayCooking , actionTitle: Spec.titleActionAllRecepies)
        case .allCategories:
            header.configure(title: Spec.titleCategory)
        default:
            return nil
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .todayCooking:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCookingTableViewCell", for: indexPath) as! TodayCookingTableViewCell
            cell.cellView.hasLargeImage = true
            return cell
        case .allCategories:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let item = categories[indexPath.row]
            cell.categoryLabel.text = item.category
//            cell.categoryImage.image = item.imageOfCategory
            return cell
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        selectedCategory = categories[indexPath.row]
        performSegue(withIdentifier: "toCategory", sender: self)
    }
}
