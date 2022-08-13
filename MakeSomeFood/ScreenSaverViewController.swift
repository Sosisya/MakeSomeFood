import UIKit

class ScreenSaverViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: "toAuth", sender: self)
        }
    }
}
