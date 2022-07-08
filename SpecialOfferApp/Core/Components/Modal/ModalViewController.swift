import UIKit

final class ModalViewController: UIViewController {

    private let customView = ModalView()
    override func loadView() { self.view = customView }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showAlert(model: RemainingTime, on viewController: UIViewController) {
        guard let targetView = viewController.view else { return }
        customView.showAlert(on: targetView, withTime: createCorrectFormat(with: model))
    }

    /// Method remove empty (00) time segments from result string
    private func createCorrectFormat(with model: RemainingTime) -> String {
        var days = "\(model.days):"
        var hours = "\(model.hours):"
        var minutes = "\(model.minutes):"
        let seconds = "\(model.seconds)"

        if days == "00:" && hours != "00:" {
            days = String()
        } else if days == "00:" && hours == "00:" && minutes != "00:" {
            days = String()
            hours = String()
        } else if days == "00:" && hours  == "00:" && minutes == "00:" {
            days = String()
            hours = String()
            minutes = String()
        }
        return days + hours + minutes + seconds
    }

}
