import UIKit

final class TimerViewController: UIViewController {

    private let customView = TimerView()
    override func loadView() { self.view = customView }
    
    var timer: Timer = Timer()
    var seconds: Int = 86400
    var timerCounting: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setupView()
        
        timerCounting = true
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerCounter),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func timerCounter() {
        if seconds > 0 {
            seconds -= 1
        } else {
            timer.invalidate()
            seconds = 0
        }
        
        updateTimer(seconds: seconds)
    }
    
    func getCountdown(for: Int) -> (days: Int, hours: Int, minutes: Int, seconds: Int) {
        return (
            ((seconds / 3600) / 24),
            (seconds / 3600),
            ((seconds % 3600) / 60),
            ((seconds % 3600) % 60)
        )
    }
    
    func getCurrentCountdown() -> RemainingTime {
        let remainingTime = RemainingTime(
            days: customView.days.label.text ?? String(),
            hours: customView.hours.label.text ?? String(),
            minutes: customView.minutes.label.text ?? String(),
            seconds: customView.seconds.label.text ?? String()
        )
        return remainingTime
    }
    
    private func changeValueWithAnimationIfNedeed(label: UILabel, newValue: String) {
        if label.text != newValue {
            label.pushOutTransition(0.3)
            label.text = newValue
            label.pushInTransition(0.3)
        }
    }
    
    private func updateTimer(seconds: Int) {
        let time = getCountdown(for: seconds)
        
        let secondsString = String(format: "%02d", time.seconds)
        let minutesString = String(format: "%02d", time.minutes)
        let hoursString = String(format: "%02d", time.hours)
        let daysString = String(format: "%02d", time.days)
        
        changeValueWithAnimationIfNedeed(label: customView.seconds.label, newValue: secondsString)
        changeValueWithAnimationIfNedeed(label: customView.minutes.label, newValue: minutesString)
        changeValueWithAnimationIfNedeed(label: customView.hours.label, newValue: hoursString)
        changeValueWithAnimationIfNedeed(label: customView.days.label, newValue: daysString)
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIScene.didActivateNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIScene.willDeactivateNotification, object: nil)
    }
    
    @objc private func didEnterBackground(notification: NSNotification) {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func willEnterForeground(notification: NSNotification) {
        timer.invalidate()
    }
}
