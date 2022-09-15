import UIKit

class ProfileTableViewController: UITableViewController {

    private struct Spec {
        static let title = "Профиль"
        static let titleFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
//        static let destructiveTextColor = UIColor.red
//        static let defaulTextColor = UIColor(named: "black")
    }

    private enum Section: CaseIterable {
        case image
        case textField
        case action
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
        case .image:
            return 1
        case .textField:
            return 1
        case . action:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section.allCases[indexPath.section] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhotoTableViewCell", for: indexPath) as! ProfilePhotoTableViewCell
            return cell
        case .textField:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTextFieldTableViewCell", for: indexPath) as! ProfileTextFieldTableViewCell
        case .action:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAppendButtonTableViewCell", for: indexPath) as! ProfileAppendButtonTableViewCell
//            let item = profile[indexPath.row]


//            cell.profileLabel.text = item.profileLabel
//            cell.profileImage.image = item.iconImage
//            cell.profileLabel.textColor = item.isDestructive ? Spec.destructiveTextColor : Spec.defaulTextColor
            return cell
        }
        return UITableViewCell()
    }
}
