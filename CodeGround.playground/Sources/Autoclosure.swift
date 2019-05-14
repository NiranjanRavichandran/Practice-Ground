import UIKit

// we use @autoclosure to avoid having to evaluate the default value every time this method is called.
extension Dictionary where Value == Any {
    func value<T>(forKey key: Key, defaultValue: @autoclosure () -> T) -> T {
        guard let value = self[key] as? T else {
            return defaultValue()
        }
        
        return value
    }
}

func animate(_ animation: @autoclosure @escaping () -> Void, duration: TimeInterval) {
    UIView.animate(withDuration: duration, animations: animation)
}
