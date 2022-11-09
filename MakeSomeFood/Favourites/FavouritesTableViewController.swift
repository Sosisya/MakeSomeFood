import UIKit

class FavouritesTableViewController: UITableViewController, RecipePresenting {

    private struct Spec {
        static var titleOfHeader = "Favourites"
        static var fontOfHeaderFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Spec.titleOfHeader
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.fontOfHeaderFont]
        tableView.register(UINib(nibName: "SpecialTableViewCell", bundle: nil), forCellReuseIdentifier: "SpecialTableViewCell")
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteRecepies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialTableViewCell", for: indexPath) as! SpecialTableViewCell
        let item = favouriteRecepies[indexPath.row]
        cell.cellView.nameOfMeal.text = item.nameOfMeal
        cell.cellView.coverImageView.image = item.image
        cell.cellView.categoryTagLabel.text = item.categoryTagLabel
        cell.cellView.areaTagLabel.text = item.areaTagLabel
        cell.cellView.setIsFavourite(true)
        cell.cellView.hasLargeImage = false
        return cell
    }
}
