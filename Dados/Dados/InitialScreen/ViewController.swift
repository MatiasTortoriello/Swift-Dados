import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func navigateButtonPressed() {
        let destinationViewController = DestinationViewController()
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(destinationViewController, animated: true, completion: nil)
    }
}
