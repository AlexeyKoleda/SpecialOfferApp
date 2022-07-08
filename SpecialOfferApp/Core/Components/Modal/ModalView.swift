import UIKit
import SnapKit

final class ModalView: UIView {

    private struct Constants {
        static let titleText = "Great!"
        static let messageText = "Offer activated at "
        static let backgroungAlpha: CGFloat = 0.6
    }

    private let contentContainer: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0
        return backgroundView
    }()

    private let modalView: UIView = {
        let modal = UIView()
        modal.layer.masksToBounds = true
        modal.layer.cornerRadius = 12
        modal.backgroundColor = UIColor(red: 0/250, green: 0/250, blue: 80/250, alpha: 1.0)
        return modal
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleText
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 25.scalable(), weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.addShadow(
            shadowColor: UIColor.white.cgColor,
            shadowOffset: CGSize(width: 0, height: 0),
            shadowOpacity: 10,
            shadowRadius: 10
        )
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 10.scalable(), weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
}

extension ModalView {

    private func setTextWithRemainingTime(_ time: String) {
        messageLabel.text = Constants.messageText + time
    }

    func showAlert(on targetView: UIView, withTime time: String) {
        contentContainer.frame = targetView.bounds
        targetView.addSubview(contentContainer)
        contentContainer.alpha = Constants.backgroungAlpha

        targetView.addSubview(modalView)
        modalView.snp.makeConstraints { make in
            make.center.equalTo(contentContainer.center)
            make.width.equalTo(160.scalable())
            make.height.equalTo(80.scalable())
        }

        setTextWithRemainingTime(time)
        modalView.addSubviews([titleLabel, messageLabel])

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview()
            make.height.equalTo(25.scalable())
        }

        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(20.scalable())
        }
    }
}
