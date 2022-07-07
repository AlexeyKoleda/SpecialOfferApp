import UIKit

class TimerViewController: UIViewController {

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

    @objc func timerCounter() -> Void {
        seconds = seconds - 1
        let time = getCountdown(for: seconds)
        
        customView.days.text = String(format: "%02d", time.days)
        customView.hours.text = String(format: "%02d", time.hours)
        customView.minutes.text = String(format: "%02d", time.minutes)
        customView.seconds.text = String(format: "%02d", time.seconds)
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
            days: customView.days.text ?? String(),
            hours: customView.hours.text ?? String(),
            minutes: customView.minutes.text ?? String(),
            seconds: customView.seconds.text ?? String()
        )
        return remainingTime
    }

}
