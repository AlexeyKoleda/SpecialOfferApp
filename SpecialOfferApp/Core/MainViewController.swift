import UIKit

final class MainViewController: UIViewController {

    private let customView = MainView()
    override func loadView() { self.view = customView }

    private lazy var timerVC = TimerViewController()
    private lazy var modalVC = ModalViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setupView()
        addChildrenVC()

        customView.activateOfferButton.addTarget(
            self,
            action: #selector(activateButtonTapped),
            for: .touchUpInside
        )

        activateOfferAction()
    }

    private func addChildrenVC() {
        addChild(timerVC)
        view.addSubview(timerVC.view)
        customView.timerView.addChildSubviewByPinningEdges(timerVC.view)
    }

    @objc private func activateButtonTapped() {
        customView.didTapActivateButton?(timerVC.getCurrentCountdown())
        timerVC.timer.invalidate()
    }

    private func activateOfferAction() {
        customView.didTapActivateButton = { [weak self] countdown in
            guard let self = self else { return }
            self.modalVC.showAlert(model: countdown, on: self)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
