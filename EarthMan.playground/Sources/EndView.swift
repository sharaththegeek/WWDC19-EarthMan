import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class EndView: UIView {
    var currentLevel = Int()
    var content = UILabel()
    var nextButton = UIButton()
    var buttonText = UILabel()
    var audioPlayer = AVAudioPlayer()
    public init(scene: UIView, level: Int, result: String){
        super.init(frame:CGRect(x:0,y:0,width:1024,height:500))
        currentLevel = level
        displayResult(result: result)
    }
    required public init(coder aDecoder: NSCoder){
        fatalError("Not working")
    }
    func displayResult(result: String){
        self.frame = CGRect(x:0,y:0,width:1024,height:500)
        if result == "Petrol" {
             self.backgroundColor = UIColor(red: CGFloat(163.0/255.0), green: CGFloat(163.0/255.0), blue: CGFloat(163.0/255.0), alpha: CGFloat(1.0))
            let beginSound = Bundle.main.url(forResource: "lost", withExtension: "mp3")
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
                self.audioPlayer.volume = 1.0
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
            if currentLevel != 3{
                content.text = "EarthMan! EarthMan! Your beloved citizens have ran out of petrol. You have failed to keep transportation alive. There are no second chances in life. But Mother Earth is kind and she is ready to take you to your next mission!"
            }
            else {
                content.text = "EarthMan! EarthMan! What will our dear humans do if they can't move? You failed to save the petrol resources. Mother Earth is not happy."
            }
        }
        else if result == "Loss" {
            self.backgroundColor = UIColor(red: CGFloat(163.0/255.0), green: CGFloat(163.0/255.0), blue: CGFloat(163.0/255.0), alpha: CGFloat(1.0))
            let beginSound = Bundle.main.url(forResource: "treefall", withExtension: "mp3")
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
                self.audioPlayer.volume = 1.0
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
            if currentLevel != 3 {
            content.text = "Oh my dear EarthMan! You have failed to keep deforestation at bay. Plastic management is a messs. Mother Earth is unhappy. There are no second chances in life. But Mother Earth is kind, for she has decided to take you through to the next mission!"
            }
            else {
                content.text = "EarthMan, dear EarthMan! You failed in your duty. Deforestation has led to large scale pollution and has affected human health. Mother Earth is unhappy."
            }
        }
        else if result == "Win" {
            self.backgroundColor = UIColor(red: CGFloat(166.0/255.0), green: CGFloat(209.0/255.0), blue: CGFloat(168.0/255.0), alpha: CGFloat(1.0))
            let beginSound = Bundle.main.url(forResource: "tada", withExtension: "mp3")
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
                self.audioPlayer.volume = 1.0
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
            if currentLevel != 3 {
                content.text = "Mother Earth is smiling with glee. Her only hero has saved her from the cruel clutches of humanity. But there's more to come, so gear up!"
            }
            else {
                content.text = "You proved you're worthy of your name! Whaaaat a Maannn, the one and only EarthMan! Mother Earth salutes you!"
            }
        }
        content.frame = CGRect (x: 0, y: 0, width: 700, height: 300)
        content.textAlignment = .center
        content.font = UIFont (name: "HelveticaNeue-Bold",size: 20)
        if result != "Win" {
        content.textColor = UIColor(red: CGFloat(214.0/255.0), green: CGFloat(65.0/255.0), blue: CGFloat(65.0/255.0), alpha: CGFloat(1.0))
        }
        else {
            content.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
        }
        content.numberOfLines = 0
        content.sizeToFit()
        content.lineBreakMode = NSLineBreakMode.byWordWrapping
        content.center = CGPoint(x: 380, y: self.frame.size.height/2)
        nextButton.frame = CGRect(x: 320, y: 380, width: 100, height: 30)
        nextButton.layer.cornerRadius = 12.0
        nextButton.backgroundColor = UIColor(red: CGFloat(237.0/255.0), green: CGFloat(239.0/255.0), blue: CGFloat(242.0/255.0), alpha: CGFloat(1.0))
        buttonText.text = "Next"
        buttonText.font = UIFont(name: "HelveticaNeue", size: 20)
        buttonText.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        buttonText.textAlignment = .center
        buttonText.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
        nextButton.addSubview(buttonText)
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(nextButton)
        self.addSubview(content)
    }
    @objc func buttonTapped() {
        if currentLevel == 1 {
            self.removeFromSuperview()
            let level = LevelView(scene: self, level: 2)
            PlaygroundPage.current.liveView = level
        }
        else if currentLevel == 2{
            self.removeFromSuperview()
            let level = LevelView(scene: self, level: 3)
            PlaygroundPage.current.liveView = level
        }
        else if currentLevel == 3{
            self.removeFromSuperview()
            let level = ExitView(scene: self)
            PlaygroundPage.current.liveView = level
        }
    }
}
