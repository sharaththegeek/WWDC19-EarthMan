import Foundation
import UIKit
import PlaygroundSupport
import AVFoundation

public class LevelView: UIView {
    let introContent = UILabel()
    var introImages = [UIImageView]()
    var helperImageText = [UILabel]()
    let generalText = UILabel()
    let buttonText = UILabel()
    let introTitle = UILabel()
    let startButton = UIButton()
    var currentLevel = Int()
    var audioPlayer = AVAudioPlayer()
    var audioPlayer1 = AVAudioPlayer()
    public init(scene: UIView, level: Int){
        super.init(frame:CGRect(x:0,y:0,width:1024,height:500))
        currentLevel = level
        displayLevelIntro(level)
    }
    required public init(coder aDecoder: NSCoder){
        fatalError("Not working")
    }
    func displayLevelIntro(_ level: Int){
        self.frame = CGRect(x:0,y:0,width:1024,height:500)
        self.backgroundColor = UIColor(red: CGFloat(166.0/255.0), green: CGFloat(209.0/255.0), blue: CGFloat(168.0/255.0), alpha: CGFloat(1.0))
        let beginSound = Bundle.main.url(forResource: "footsteps", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        if level == 1 {
            introTitle.text = "Level 1: 1998"
            introContent.text = "\n\nWelcome to 1998 EarthMan!\n\n 1. The world is running out of fuel. Keep collecting fuel to make sure the world keeps running. \n\n 2. If you collect too much plastic, you end up suffocating the Earth. \n\n 3. If you cut too many trees, you end up killing our poor Mother Earth!"
            introContent.numberOfLines = 0
            let levelSound = Bundle.main.url(forResource: "1998", withExtension: "m4a")
            do {
                audioPlayer1 = try AVAudioPlayer(contentsOf: levelSound!)
            }
            catch {
                print(error)
            }
            audioPlayer1.play()
            introContent.font = UIFont(name: "HelveticaNeue", size: 20)
            introContent.lineBreakMode = NSLineBreakMode.byWordWrapping
            introContent.sizeToFit()
            introTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
            introTitle.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            introContent.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            introTitle.frame = CGRect(x: 260, y: 0, width: 300, height: 100)
            introContent.frame = CGRect(x: 30, y: 50, width: 700, height: 300)
            self.addSubview(introTitle)
            self.addSubview(introContent)
            startButton.frame = CGRect(x: 320, y: 380, width: 100, height: 30)
            startButton.layer.cornerRadius = 12.0
            startButton.backgroundColor = UIColor(red: CGFloat(237.0/255.0), green: CGFloat(239.0/255.0), blue: CGFloat(242.0/255.0), alpha: CGFloat(1.0))
            buttonText.text = "Play"
            buttonText.font = UIFont(name: "HelveticaNeue", size: 20)
            buttonText.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
            buttonText.textAlignment = .center
            buttonText.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
            startButton.addSubview(buttonText)
            self.addSubview(startButton)
            startButton.isHidden = true
            introImages.append(UIImageView(image: UIImage(named:"intro-wood.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-plastic.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-petrol.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-solar.png")))
            helperImageText.append(UILabel(frame: CGRect(x: 170, y: 270, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 280, y: 270, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 390, y: 270, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 505, y: 270, width: 100, height: 100)))
            startButton.addTarget(self, action: #selector(startLevel), for: .touchUpInside)
            helperImageText[0].text = "Wood"
            helperImageText[1].text = "Plastic"
            helperImageText[2].text = "Petrol"
            helperImageText[3].text = "Solar"
            generalText.text = " Click on a block that is horizontal or vertical to you to travel to that block.\n \n For every block of : \n Wood - 20 Trees are cut \n Plastics - a tonne of plastic is burned. \n Petrol - you gain 20 kilo litres of petrol.\n Solar - you gain 20 litres of usable solar fuel."
            generalText.frame = CGRect(x: 70, y: 25, width: 800, height: 100)
            generalText.font = UIFont(name: "HelveticaNeue", size: 18)
            generalText.numberOfLines = 0
            generalText.lineBreakMode = NSLineBreakMode.byWordWrapping
            generalText.sizeToFit()
            generalText.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            self.addSubview(generalText)
            generalText.isHidden = true
            introImages[0].frame = CGRect(x: 145, y: 200, width: 100, height: 100)
            introImages[1].frame = CGRect(x: 255, y: 200, width: 100, height: 100)
            introImages[2].frame = CGRect(x: 365, y: 200, width: 100, height: 100)
            introImages[3].frame = CGRect(x: 475, y: 200, width: 100, height: 100)
            for image in introImages {
                self.addSubview(image)
                image.isHidden = true
            }
            for text in helperImageText {
                text.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
                self.addSubview(text)
                text.isHidden = true
            }
            
        }
        else if level == 2 {
            introTitle.text = "Level 2: 2008"
            introContent.text = "\n\nWelcome to 2008 EarthMan! \n\n 1. The computer industry is discarding tonnes of e-waste on a daily basis \n\n 2. There's no environmental solution as of now. Try avoiding the metal wastes \n\n 3. Fuel is even lesser now. Collect as much fuel as you can. \n\n 4. Deforestation is at a high. Avoid cutting too many trees if you wish to save Earth."
            introContent.numberOfLines = 0
            let levelSound = Bundle.main.url(forResource: "2008", withExtension: "m4a")
            do {
                audioPlayer1 = try AVAudioPlayer(contentsOf: levelSound!)
            }
            catch {
                print(error)
            }
            audioPlayer1.play()
            introContent.font = UIFont(name: "HelveticaNeue", size: 20)
            introContent.lineBreakMode = NSLineBreakMode.byWordWrapping
            introContent.sizeToFit()
            introTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
            introTitle.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            introContent.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            introTitle.frame = CGRect(x: 260, y: 0, width: 300, height: 100)
            introContent.frame = CGRect(x: 30, y: 50, width: 700, height: 300)
            self.addSubview(introTitle)
            self.addSubview(introContent)
            startButton.frame = CGRect(x: 320, y: 380, width: 100, height: 30)
            startButton.layer.cornerRadius = 12.0
            startButton.backgroundColor = UIColor(red: CGFloat(237.0/255.0), green: CGFloat(239.0/255.0), blue: CGFloat(242.0/255.0), alpha: CGFloat(1.0))
            buttonText.text = "Play"
            buttonText.font = UIFont(name: "HelveticaNeue", size: 20)
            buttonText.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
            buttonText.textAlignment = .center
            buttonText.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
            startButton.addSubview(buttonText)
            startButton.addTarget(self, action: #selector(startLevel), for: .touchUpInside)
            self.addSubview(startButton)
            startButton.isHidden = true
            introImages.append(UIImageView(image: UIImage(named:"intro-wood.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-plastic.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-petrol.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-solar.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-wasted.png")))
            helperImageText.append(UILabel(frame: CGRect(x: 130, y: 290, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 240, y: 290, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 350, y: 290, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 465, y: 290, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 550, y: 290, width: 100, height: 100)))
            helperImageText[0].text = "Wood"
            helperImageText[1].text = "Plastic"
            helperImageText[2].text = "Petrol"
            helperImageText[3].text = "Solar"
            helperImageText[4].text = "Metal Waste"
            generalText.text = " Click on a block that is horizontal or vertical to you to travel to that block.\n \n For every block of : \n Wood - 400 trees are cut. \n Plastics - a tonne of plastic is burned. \n Petrol - you gain 20 kilo litres of petrol.\n Solar - you gain 20 litres of usable solar fuel.\n Metal Wastes - you discard 200 tonnes of e-waste"
            generalText.frame = CGRect(x: 70, y: 25, width: 800, height: 100)
            generalText.font = UIFont(name: "HelveticaNeue", size: 18)
            generalText.numberOfLines = 0
            generalText.lineBreakMode = NSLineBreakMode.byWordWrapping
            generalText.sizeToFit()
            generalText.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            self.addSubview(generalText)
            generalText.isHidden = true
            introImages[0].frame = CGRect(x: 105, y: 220, width: 100, height: 100)
            introImages[1].frame = CGRect(x: 215, y: 220, width: 100, height: 100)
            introImages[2].frame = CGRect(x: 325, y: 220, width: 100, height: 100)
            introImages[3].frame = CGRect(x: 435, y: 220, width: 100, height: 100)
            introImages[4].frame = CGRect(x: 545, y: 220, width: 100, height: 100)
            for image in introImages {
                self.addSubview(image)
                image.isHidden = true
            }
            for text in helperImageText {
                text.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
                self.addSubview(text)
                text.isHidden = true
            }
        }
        else if level == 3 {
            introTitle.text = "Level 3: 2018"
            introContent.text = "\n\nWelcome to 2018 EarthMan! \n\n 1. A company called Apple Inc. has introduced a new alloy of recycled Aluminium. \n\n 2. This is a wonderful solution to our metal wastes problem. Collect more alloy blocks. \n\n 3. Plastics and deforestation are at a high. Avoid them. \n\n 4. Fuel consumption is exponential due to rise in population. Things are harder than ever. \n\n Good luck!"
            introContent.numberOfLines = 0
            let levelSound = Bundle.main.url(forResource: "2018", withExtension: "m4a")
            do {
                audioPlayer1 = try AVAudioPlayer(contentsOf: levelSound!)
            }
            catch {
                print(error)
            }
            audioPlayer1.play()
            introContent.font = UIFont(name: "HelveticaNeue", size: 20)
            introContent.lineBreakMode = NSLineBreakMode.byWordWrapping
            introContent.sizeToFit()
            introTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
            introTitle.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            introContent.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            introTitle.frame = CGRect(x: 260, y: 0, width: 300, height: 100)
            introContent.frame = CGRect(x: 30, y: 50, width: 700, height: 300)
            self.addSubview(introTitle)
            self.addSubview(introContent)
            startButton.frame = CGRect(x: 320, y: 380, width: 100, height: 30)
            startButton.layer.cornerRadius = 12.0
            startButton.backgroundColor = UIColor(red: CGFloat(237.0/255.0), green: CGFloat(239.0/255.0), blue: CGFloat(242.0/255.0), alpha: CGFloat(1.0))
            buttonText.text = "Play"
            buttonText.font = UIFont(name: "HelveticaNeue", size: 20)
            buttonText.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
            buttonText.textAlignment = .center
            buttonText.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(219.0/255.0), alpha: CGFloat(1.0))
            startButton.addSubview(buttonText)
            startButton.addTarget(self, action: #selector(startLevel), for: .touchUpInside)
            self.addSubview(startButton)
            startButton.isHidden = true
            introImages.append(UIImageView(image: UIImage(named:"intro-wood.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-plastic.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-petrol.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-solar.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-wasted.png")))
            introImages.append(UIImageView(image: UIImage(named: "intro-aluminium.png")))
            helperImageText.append(UILabel(frame: CGRect(x: 80, y: 310, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 190, y: 310, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 300, y: 310, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 415, y: 310, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 500, y: 310, width: 100, height: 100)))
            helperImageText.append(UILabel(frame: CGRect(x: 617, y: 310, width: 100, height: 100)))
            helperImageText[0].text = "Wood"
            helperImageText[1].text = "Plastic"
            helperImageText[2].text = "Petrol"
            helperImageText[3].text = "Solar"
            helperImageText[4].text = "Metal Waste"
            helperImageText[5].text = "New Alloy"
            generalText.text = " Click on a block that is horizontal or vertical to you to travel to that block.\n \n For every block of : \n Wood - 8000 trees are cut \n Plastics - a tonne of plastic is burned \n Petrol - you gain 20 kilo litres of petrol \n Solar - you gain 20 litres of usable solar fuel.\n Metal Wastes - you discard 200 tonnes of e-waste.\n New Alloy - 20 tonnes of e-waste is avoided."
            generalText.frame = CGRect(x: 70, y: 25, width: 800, height: 100)
            generalText.font = UIFont(name: "HelveticaNeue", size: 18)
            generalText.numberOfLines = 0
            generalText.lineBreakMode = NSLineBreakMode.byWordWrapping
            generalText.sizeToFit()
            generalText.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
            self.addSubview(generalText)
            generalText.isHidden = true
            introImages[0].frame = CGRect(x: 55, y: 240, width: 100, height: 100)
            introImages[1].frame = CGRect(x: 165, y: 240, width: 100, height: 100)
            introImages[2].frame = CGRect(x: 275, y: 240, width: 100, height: 100)
            introImages[3].frame = CGRect(x: 385, y: 240, width: 100, height: 100)
            introImages[4].frame = CGRect(x: 495, y: 240, width: 100, height: 100)
            introImages[5].frame = CGRect(x: 605, y: 240, width: 100, height: 100)
            for image in introImages {
                self.addSubview(image)
                image.isHidden = true
            }
            for text in helperImageText {
                text.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(34.0/255.0), blue: CGFloat(128.0/255.0), alpha: CGFloat(1.0))
                self.addSubview(text)
                text.isHidden = true
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.5){
            let beginSound1 = Bundle.main.url(forResource: "wind", withExtension: "mp3")
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound1!)
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
            self.introContent.isHidden = true
            self.introTitle.isHidden = true
            for image in self.introImages {
                image.isHidden = false
            }
            for helpText in self.helperImageText {
                helpText.isHidden = false
            }
            self.generalText.isHidden = false
            self.startButton.isHidden = false
        }
    }
    @objc func startLevel(){
            self.removeFromSuperview()
            let level = GameView(scene: self, level: currentLevel)
            PlaygroundPage.current.liveView = level
    }
}

