import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class IntroView: UIView {
    var introScreen = UIView()
    let beginText = UILabel()
    let titleText = UILabel()
    let startButton = UIButton()
    let introImage = UIImageView()
    let buttonText = UILabel()
    var audioPlayer = AVAudioPlayer()
    var audioPlayer1 = AVAudioPlayer()
    public init(scene: UIView){
        super.init(frame:CGRect(x:0,y:0,width:1024,height:500))
        displayContent()
    }
    required public init(coder aDecoder: NSCoder){
        fatalError("Not working")
    }
    
    func displayContent(){
        self.frame = CGRect(x:0,y:0,width:1024,height:500)
        self.backgroundColor = UIColor(red: CGFloat(166.0/255.0), green: CGFloat(209.0/255.0), blue: CGFloat(168.0/255.0), alpha: CGFloat(1.0))
        let beginSound = Bundle.main.url(forResource: "waterfall", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        beginText.text = "How would you feel if you were a superhero for a day?"
        beginText.textAlignment = .center
        beginText.frame = CGRect(x:0,y:0,width:900,height:100)
        beginText.font = UIFont (name: "HelveticaNeue-Bold",size: 25)
        beginText.textColor = UIColor(red: CGFloat(112.0/255.0), green: CGFloat(112.0/255.0), blue: CGFloat(112.0/255.0), alpha: CGFloat(1.0))
        beginText.center = CGPoint(x: 380, y: self.frame.size.height/2)
        self.addSubview(beginText)
        
        //Change text
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
        self.beginText.fadeTransition(0.8)
        self.beginText.text = "What if you were Mother Earth's only hero?"
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
            self.beginText.fadeTransition(0.8)
        let beginSound2 = Bundle.main.url(forResource: "wind", withExtension: "mp3")
        do{
            self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound2!)
            self.audioPlayer.volume = 1.0
        }
        catch {
            print(error)
        }
        self.audioPlayer.play()
            self.beginText.text = "Introducing"
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 6.0){
            self.beginText.fadeTransition(0.4)
            self.beginText.isHidden = true
        
            self.showTitle()
    }
    }
    func showTitle(){
        introImage.image = UIImage(named: "IntroFly.png")
        introImage.frame = CGRect(x: 325, y: 500, width: 90, height: 150)
        self.addSubview(introImage)
        UIView.animate(withDuration: 3.5, delay: 0, options: .curveLinear, animations: {
            self.introImage.frame.origin.y = -150
        }, completion: nil)
        titleText.text = "EarthMan"
        titleText.frame = CGRect(x: 0, y: 0, width: 900, height: 100)
        titleText.center = CGPoint(x: (self.frame.size.width/2)+170, y: (self.frame.size.height/2)-20)
        titleText.font = UIFont (name: "HelveticaNeue-Medium", size: 60)
        titleText.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
        titleText.shadowColor = UIColor.gray
        titleText.shadowOffset = CGSize(width: 0, height: 1.5)
        self.addSubview(titleText)
        startButton.frame = CGRect(x: 320, y: 350, width: 100, height: 30)
        startButton.layer.cornerRadius = 12.0
        startButton.backgroundColor = UIColor(red: CGFloat(237.0/255.0), green: CGFloat(239.0/255.0), blue: CGFloat(242.0/255.0), alpha: CGFloat(1.0))
        buttonText.text = "Start"
        buttonText.font = UIFont(name: "HelveticaNeue", size: 20)
        buttonText.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        buttonText.textAlignment = .center
        buttonText.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
        startButton.addSubview(buttonText)
        self.addSubview(startButton)
        startButton.isHidden = true
        titleText.isHidden = true
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.titleText.isHidden = false
            let beginSound3 = Bundle.main.url(forResource: "depth", withExtension: "mp3")
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound3!)
                self.audioPlayer.volume = 1.0
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.75){
            self.startButton.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5){
            let beginSound4 = Bundle.main.url(forResource: "thunder", withExtension: "mp3")
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound4!)
                self.audioPlayer.volume = 1.0
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
        }
    }
    @objc func startAction(sender: UIButton!){
        self.removeFromSuperview()
        
        let level = LevelView(scene: self, level: 1)
        PlaygroundPage.current.liveView = level
    }
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval){
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: "CATransitionType.fade")
    }
}
