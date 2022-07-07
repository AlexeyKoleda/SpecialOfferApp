import UIKit
import SnapKit

struct RemainingTime {
    var days, hours, minutes, seconds: String
}

final class ModalView: UIView {
    
    struct Settings {
        static let titleText = "Great!"
        static let messageText = "Offer activated at "
        static let backgroungAlpha: CGFloat = 0.6
    }
    
    let contentContainer: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
   let modalView: UIView = {
        let modal = UIView()
        modal.layer.masksToBounds = true
        modal.layer.cornerRadius = 12
        modal.backgroundColor = UIColor(red: 0/250, green: 0/250, blue: 80/250, alpha: 1.0)
        return modal
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.titleText
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 30, weight: UIFont.Weight.bold)
        label.textAlignment = .center
        label.addShadow(
            shadowColor: UIColor.white.cgColor,
            shadowOffset: CGSize(width: 0, height: 0),
            shadowOpacity: 10,
            shadowRadius: 10
        )
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        label.textAlignment = .center
        return label
    }()
}

extension ModalView {
    
    private func setTextWithRemainingTime(_ time: String) {
        messageLabel.text = Settings.messageText + time
    }
    
    func showAlert(on targetView: UIView, withTime time: String) {
        contentContainer.frame = targetView.bounds
        targetView.addSubview(contentContainer)
        self.contentContainer.alpha = Settings.backgroungAlpha
        
        targetView.addSubview(modalView)
        modalView.snp.makeConstraints { make in
            make.center.equalTo(contentContainer.center)
            make.width.equalTo(160)
            make.height.equalTo(80)
        }
        
        setTextWithRemainingTime(time)
        modalView.addSubviews([titleLabel, messageLabel])
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview()
            make.height.equalTo(25)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
       
        
 
    }
}


extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func addShadow(
        shadowColor: CGColor,
        shadowOffset: CGSize,
        shadowOpacity: Float,
        shadowRadius: CGFloat
    ) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}
