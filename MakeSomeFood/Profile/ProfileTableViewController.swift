import UIKit

class ProfileTableViewController: UITableViewController {

    private struct Spec {
        static let title = "Профиль"
        static let titleFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
        static let destructiveTextColor = UIColor.red
        static let defaulTextColor = UIColor(named: "black")
    }

    private enum Section: CaseIterable {
        case imageAndName
        case actions
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        title = Spec.title
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.titleFont]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section.allCases[section] {
        case .imageAndName:
            return 1
        case .actions:
            return profile.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section.allCases[indexPath.section] {
        case .imageAndName:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageAndNameTableViewCell", for: indexPath) as! ProfileImageAndNameTableViewCell
            return cell
        case .actions:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            let item = profile[indexPath.row]
            cell.profileLabel.text = item.profileLabel
            cell.profileImage.image = item.iconImage
            cell.profileLabel.textColor = item.isDestructive ? Spec.destructiveTextColor : Spec.defaulTextColor
            return cell
        }
    }
}
