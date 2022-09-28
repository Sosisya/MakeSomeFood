import UIKit

class RecepieViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let headerView = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 250))
               // Image from unsplash: https://unsplash.com/photos/iVPWGCbFwd8
               headerView.imageView.image = UIImage(named: "headerbg")
               self.tableView.tableHeaderView = headerView



        tableView.dataSource = self
        tableView.delegate = self

        tableView.separatorStyle = .none


    }
}

extension RecepieViewController: UITableViewDelegate, UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 1
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameOfRecepieTableViewCell", for: indexPath) as! NameOfRecepieTableViewCell
            cell.first.text = "luiza"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsForRecepieTableViewCell", for: indexPath) as! IngredientsForRecepieTableViewCell
            cell.textLabel?.text = "Ингредиенты"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescritionOfRecepieTableViewCell", for: indexPath) as! DescritionOfRecepieTableViewCell
            cell.textLabel?.text = "Суп – жидкое блюдо, первое блюдо. Многие разновидности супов получили самостоятельные наименования, некоторые сохранили в своем названии слово «суп». Вы найдете на нашем сайте многие тысячи рецептов супов на каждый день и оригинальных, рецепты простых супов и не очень, пошаговые рецепты супов с фото и видео, а также ответы на вопросы, как приготовить суп, как сварить суп, советы по приготовлению супа. И ваш домашний суп всегда будет вкусным супом. А, может, и вы пришлете нам рецепт супа с пошаговыми фото?"
            return cell
        default:
            fatalError()
        }
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
        switch section {
        case 0:
            header.configure(title:  "")
        case 1:
            header.configure(title: "Ингредиенты")
        case 2:
            header.configure(title: "Описание")
        default:
            return nil
        }
        return header
    }
}

extension RecepieViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.tableView.tableHeaderView as! StretchyTableHeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
}
