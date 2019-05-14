import UIKit
import XCPlayground
import PlaygroundSupport

var str = "Hello, playground"

let currentView = UIView(frame: CGRect(x: 0, y: 0, width: 350, height: 600))
currentView.backgroundColor = .white

PlaygroundPage.current.liveView = currentView



