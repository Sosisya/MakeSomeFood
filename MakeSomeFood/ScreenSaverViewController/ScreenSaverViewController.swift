import UIKit

class ScreenSaverViewController: UIViewController {

    private struct Spec {
        static var segueTitle = "toAuth"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: Spec.segueTitle, sender: self)
        }
    }
}
