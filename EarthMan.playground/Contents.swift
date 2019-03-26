//:The EarthMan Game
/*:
 
 It is recommended to try this game on XCode Playgrounds on Mac as the screen size is optimised only for XCode.
 You can view it on iPad but the resultant will not be as good. Sorry for the inconvenience.
 
 EarthMan is a game made with an intention to educate today's masses about the ever-increasing need to save our environment. Made with <3 from India.
 */
import UIKit
import PlaygroundSupport

var launch = UIView()
var launchView = IntroView(scene: launch)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = launchView
