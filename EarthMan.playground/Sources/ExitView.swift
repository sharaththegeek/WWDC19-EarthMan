import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class ExitView: UIView {
    let exitMessage = UILabel()
    let event = UILabel()
    let finalTitle = UILabel()
    let credits = UILabel()
    let exitImage = UIImageView()
    var audioPlayer = AVAudioPlayer()
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
        let beginSound = Bundle.main.url(forResource: "ticking", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        exitMessage.text = "Environment is a serious concern. With exponential rise in global population, we need real heroes who can take care of mother Nature."
        exitMessage.textAlignment = .center
        exitMessage.numberOfLines = 0
        exitMessage.sizeToFit()
        exitMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
        exitMessage.frame = CGRect(x:0,y:0,width:700,height:100)
        exitMessage.font = UIFont (name: "HelveticaNeue-Bold",size: 25)
        exitMessage.textColor = UIColor(red: CGFloat(112.0/255.0), green: CGFloat(112.0/255.0), blue: CGFloat(112.0/255.0), alpha: CGFloat(1.0))
        exitMessage.center = CGPoint(x: 380, y: self.frame.size.height/2)
        self.addSubview(exitMessage)
        //Change text
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.exitMessage.fadeTransition(0.8)
            self.exitMessage.text = "Let us do our bit to help Mother Earth in every way we can."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
            self.exitMessage.fadeTransition(0.8)
            self.exitMessage.text = "Real heroes don't wear capes"
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0){
            self.exitMessage.fadeTransition(0.8)
            self.exitMessage.text = "They are the engineers and scientists working hard to help us live a better tomorrow"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0){
            self.exitMessage.fadeTransition(0.4)
            self.exitMessage.isHidden = true
            self.showCredits()
        }
    }
    func showCredits(){
        exitImage.image = UIImage(named: "flier.png")
        exitImage.frame = CGRect(x: -200, y: 200, width: 150, height: 70)
        finalTitle.text = "EarthMan"
        finalTitle.frame = CGRect(x: 0, y: 0, width: 900, height: 100)
        finalTitle.center = CGPoint(x: (self.frame.size.width/2)+170, y: (self.frame.size.height/2)-20)
        finalTitle.font = UIFont (name: "HelveticaNeue-Medium", size: 60)
        finalTitle.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
        finalTitle.shadowColor = UIColor.gray
        finalTitle.shadowOffset = CGSize(width: 0, height: 1.5)
        self.addSubview(finalTitle)
        finalTitle.isHidden = true
        let beginSound = Bundle.main.url(forResource: "winner", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        credits.text = "Sharath Sriram"
        event.text = "WWDC 19 Submission"
        credits.font = UIFont (name: "HelveticaNeue-Bold",size: 25)
        credits.textColor = UIColor(red: CGFloat(112.0/255.0), green: CGFloat(112.0/255.0), blue: CGFloat(112.0/255.0), alpha: CGFloat(1.0))
        credits.frame = CGRect(x:-200,y:200,width:300, height: 100)
        event.font = UIFont (name: "HelveticaNeue-Bold",size: 25)
        event.textColor = UIColor(red: CGFloat(112.0/255.0), green: CGFloat(112.0/255.0), blue: CGFloat(112.0/255.0), alpha: CGFloat(1.0))
        event.frame = CGRect(x:1000,y:250,width:300, height: 100)
        DispatchQueue.main.asyncAfter(deadline: .now() ){
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveLinear, animations: {
                self.event.frame.origin.x = 300
                self.credits.frame.origin.x = 250
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            UIView.animate(withDuration: 1, delay: 2, options: .curveLinear, animations: {
                self.event.frame.origin.x = 1000
                self.credits.frame.origin.x = -200
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            UIView.animate(withDuration: 1, delay: 2, options: .curveLinear, animations: {
                self.exitImage.frame.origin.x = 1000
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
            UIView.animate(withDuration: 1, delay: 2, options: .curveLinear, animations: {
                self.finalTitle.isHidden = false
                let beginSound1 = Bundle.main.url(forResource: "tada", withExtension: "mp3")
                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound1!)
                }
                catch {
                    print(error)
                }
                self.audioPlayer.play()
            }, completion: nil)
        }
        self.addSubview(event)
        self.addSubview(exitImage)
        self.addSubview(credits)
    }
}
