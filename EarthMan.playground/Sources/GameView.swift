import Foundation
import UIKit
import AVFoundation
import PlaygroundSupport

public class GameView: UIView {
    var currentLevel = Int()
    var timer: Timer?
    var timeLeft = 31
    let levelLabel = UILabel()
    var timeLabel = UILabel()
    var tiles = [UIImageView]()
    var current = Int()
    var Trees = 0
    var Plastics = 0
    var Petrol = 8000
    var Solar = 0
    var Waste = 0
    var Alloy = 0
    var PetrolImage = UIImageView()
    var PetrolText = UILabel()
    var SolarImage = UIImageView()
    var SolarText = UILabel()
    var TreeImage = UIImageView()
    var TreeLabel = UILabel()
    var destination = Int()
    var hero = UIImageView()
    var audioPlayer = AVAudioPlayer()
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    var columned = [[1,7,13,19,25],[2,8,14,20,26],[3,9,15,21,27],[4,10,16,22,28],[5,11,17,23,29],[6,12,18,24,30]]
    var rowed = [[1,2,3,4,5,6],[7,8,9,10,11,12],[13,14,15,16,17,18],[19,20,21,22,23,24],[25,26,27,28,29,30]]
    var imgHold = [Int]()
    public init(scene: UIView,level: Int){
        super.init(frame:CGRect(x:0,y:0,width:1024,height:500))
        currentLevel = level
        startGame()
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Not working")
    }
    func startGame(){
        let beginSound = Bundle.main.url(forResource: "nature", withExtension: "mp3")
        do{
            self.audioPlayer = try AVAudioPlayer(contentsOf: beginSound!)
            self.audioPlayer.volume = 1.0
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        self.frame = CGRect(x: 0,y: 0,width: 1024, height: 500)
        self.backgroundColor = UIColor(red: CGFloat(166.0/255.0), green: CGFloat(209.0/255.0), blue: CGFloat(168.0/255.0), alpha: CGFloat(1.0))
        timeLabel.frame = CGRect(x: 600, y: 0, width: 300, height: 100)
        self.addSubview(timeLabel)
        PetrolImage.image = UIImage(named: "Petrol.png")
        PetrolImage.frame = CGRect(x:640,y:150,width: 50, height: 50)
        PetrolText.frame = CGRect(x: 700, y: 150, width: 100, height: 50)
        self.addSubview(PetrolImage)
        self.addSubview(PetrolText)
        SolarImage.image = UIImage(named: "Solar.png")
        SolarImage.frame = CGRect(x: 640, y: 220, width: 70, height: 50)
        SolarText.frame = CGRect(x: 720, y: 220, width: 100, height: 50)
        self.addSubview(SolarImage)
        self.addSubview(SolarText)
        TreeImage.image = UIImage(named: "Wood.png")
        TreeImage.frame = CGRect(x: 640, y: 290, width: 50, height: 30)
        TreeLabel.frame = CGRect(x: 710, y: 280, width: 100, height: 50)
        self.addSubview(TreeImage)
        self.addSubview(TreeLabel)
        if currentLevel == 1 {
        levelLabel.text = "Level 1 : 1998"
        levelLabel.frame = CGRect(x: 50, y: 0, width: 300, height: 100)
        levelLabel.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(249.0/255.0), alpha: CGFloat(1.0))
        self.addSubview(levelLabel)
        for _ in 0...31 {
            let number = Int.random(in: 0...20)
            if number < 11 {
                tiles.append(UIImageView(image: UIImage(named: "intro-wood.png")))
                imgHold.append(0)
            }
            else if number > 10 && number < 17 {
                tiles.append(UIImageView(image: UIImage(named: "intro-plastic.png")))
                imgHold.append(1)
            }
            else if number > 16 && number < 20 {
                tiles.append(UIImageView(image: UIImage(named: "intro-petrol.png")))
                imgHold.append(2)
            }
            else if number > 19 && number < 21 {
                tiles.append(UIImageView(image: UIImage(named: "intro-solar.png")))
                imgHold.append(3)
            }
        }

        }
        if currentLevel == 2 {
            Petrol = 6000
            levelLabel.text = "Level 2 : 2008"
            levelLabel.frame = CGRect(x: 50, y: 0, width: 300, height: 100)
            levelLabel.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(249.0/255.0), alpha: CGFloat(1.0))
            self.addSubview(levelLabel)
            for _ in 0...31 {
                let number = Int.random(in: 0...20)
                if number < 8 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-wood.png")))
                    imgHold.append(0)
                }
                else if number > 7 && number < 12 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-plastic.png")))
                    imgHold.append(1)
                }
                else if number > 11 && number < 14 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-petrol.png")))
                    imgHold.append(2)
                }
                else if number > 13 && number < 17 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-solar.png")))
                    imgHold.append(3)
                }
                else if number > 16 && number < 21 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-wasted.png")))
                    imgHold.append(4)
                }
            }
        }
        if currentLevel == 3{
            Petrol = 4000
            levelLabel.text = "Level 3 : 2018"
            levelLabel.frame = CGRect(x: 50, y: 0, width: 300, height: 100)
            levelLabel.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(249.0/255.0), alpha: CGFloat(1.0))
            self.addSubview(levelLabel)
            for _ in 0...31 {
                let number = Int.random(in: 0...30)
                if number < 11 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-wood.png")))
                    imgHold.append(0)
                }
                else if number > 10 && number < 19 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-plastic.png")))
                    imgHold.append(1)
                }
                else if number > 18 && number < 22 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-petrol.png")))
                    imgHold.append(2)
                }
                else if number > 21 && number < 25 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-solar.png")))
                    imgHold.append(3)
                }
                else if number > 24 && number < 29 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-wasted.png")))
                    imgHold.append(4)
                }
                else if number > 28 && number < 31 {
                    tiles.append(UIImageView(image: UIImage(named: "intro-aluminium.png")))
                    imgHold.append(5)
                }
            }
        }
        tiles[0].frame = CGRect(x:48,y:80,width:80,height:80)
        tiles[0].image = UIImage(named: "emptytile.png")
        current = 0
        self.addSubview(tiles[0])
        var xi=130
        for index in 1...6{
            tiles[index].frame = CGRect(x:xi,y:80,width:80,height:80)
            tiles[index].isUserInteractionEnabled = true
            self.tiles[index].clipsToBounds = true
            self.tiles[index].layer.masksToBounds = true
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
            tiles[index].addGestureRecognizer(singleTap)
            tiles[index].tag = index
            xi = xi+82
            self.addSubview(tiles[index])
        }
        xi = 130
        for index in 7...12{
            tiles[index].frame = CGRect(x:xi,y:162,width:80,height:80)
            tiles[index].isUserInteractionEnabled = true
            tiles[index].tag = index
            self.tiles[index].clipsToBounds = true
            self.tiles[index].layer.masksToBounds = true
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
            tiles[index].addGestureRecognizer(singleTap)
            xi = xi+82
            self.addSubview(tiles[index])
        }
        xi = 130
        for index in 13...18{
            tiles[index].frame = CGRect(x:xi,y:244,width:80,height:80)
            self.tiles[index].isUserInteractionEnabled = true
            tiles[index].tag = index
            self.tiles[index].clipsToBounds = true
            self.tiles[index].layer.masksToBounds = true
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
            self.tiles[index].addGestureRecognizer(singleTap)
            xi = xi+82
            self.addSubview(tiles[index])
        }
        xi = 130
        for index in 19...24{
            tiles[index].frame = CGRect(x:xi,y:326,width:80,height:80)
            self.tiles[index].isUserInteractionEnabled = true
            tiles[index].tag = index
            self.tiles[index].clipsToBounds = true
            self.tiles[index].layer.masksToBounds = true
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
            self.tiles[index].addGestureRecognizer(singleTap)
            xi = xi+82
            self.addSubview(tiles[index])
        }
        xi = 130
        for index in 25...30{
            tiles[index].frame = CGRect(x:xi,y:408,width:80,height:80)
            self.tiles[index].isUserInteractionEnabled = true
            tiles[index].tag = index
            self.tiles[index].clipsToBounds = true
            self.tiles[index].layer.masksToBounds = true
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
            singleTap.numberOfTapsRequired = 1
            singleTap.numberOfTouchesRequired = 1
            self.tiles[index].addGestureRecognizer(singleTap)
            xi = xi+82
            self.addSubview(tiles[index])
        }
        let Xpoint = tiles[current].frame.minX
        let Ypoint = tiles[current].frame.minY
        hero.image = UIImage(named: "normal.png")
        hero.frame = CGRect(x: Xpoint+30, y: Ypoint+5, width: 25, height: 60)
        self.addSubview(hero)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    @objc func countTime(){
        timeLeft -= 1
        if Petrol > 0 {
            if Solar > 0 {
                Solar -= 2
                Petrol -= 200
            }
            else {
                Petrol -= 300
            }
        }
        else {
            timer?.invalidate()
            timer = nil
            exitFunction()
        }
        SolarText.text = "\(Solar)"
        PetrolText.text = "\(Petrol)"
        TreeLabel.text = "\(Trees)"
        if timeLeft < 10 {
            timeLabel.textColor = UIColor.red
            let beginSound4 = Bundle.main.url(forResource: "tick", withExtension: "mp3")
            do{
                self.audioPlayer2 = try AVAudioPlayer(contentsOf: beginSound4!)
                self.audioPlayer2.volume = 1.0
            }
            catch {
                print(error)
            }
            audioPlayer2.play()
            timeLabel.text = "Time Left: 00:0\(timeLeft)"
        }
        else {
            timeLabel.textColor = UIColor(red: CGFloat(4.0/255.0), green: CGFloat(111.0/255.0), blue: CGFloat(249.0/255.0), alpha: CGFloat(1.0))
            timeLabel.text = "Time Left: 00:\(timeLeft)"
        }
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
            exitFunction()
        }
    }
    @objc func tapped(_ sender: UITapGestureRecognizer){
        let index = sender.view!.tag
        var changed = false
        if current == 0 {
            let r = rowed[0]
            if let found = r.firstIndex(of: index) {
                animateRight(source: current,destination: index)
                current = index
                scoreUpdate(lcurrent: 0, lindex: found, arr: r)
            }
        }
        else if current == index {
            
        }
        else {
            for rowed in rowed {
                if let found = rowed.firstIndex(of: index) {
                    if let found1 = rowed.firstIndex(of: current){
                        if found < found1 {
                            animateLeft(source: current, destination: index)
                        }
                        else {
                            animateRight(source: current, destination: index)
                        }
                        current = index
                        scoreUpdate(lcurrent: found1, lindex: found, arr: rowed)
                        changed = true
                    }
                }
            }
            if changed == false {
                for col in columned {
                    if let found2 = col.firstIndex(of: index) {
                        if let found3 = col.firstIndex(of: current) {
                            if found2 < found3 {
                                animateUp(source: current, destination: index)
                            }
                            else {
                                animateDown(source: current, destination: index)
                            }
                            current = index
                            scoreUpdate(lcurrent: found3, lindex: found2, arr: col)
                        }
                    }
                }
            }
        }
    }
    func scoreUpdate(lcurrent: Int, lindex: Int, arr: [Int]){
        var start = lcurrent
        var end = lindex
        if lcurrent > lindex {
            start = lindex
            end = lcurrent
        }
        while start < end {
            start = start + 1
            updateGoods(lindex: arr[start])
        }
        if currentLevel == 1 {
        var rArray = [Int]()
        for i in 1...30 {
            rArray.append(i)
        }
        var checked = [Int]()
        for _ in 1...5{
            let number = rArray.randomElement()
            if number! != current {
                if checked.firstIndex(of: number!) != nil
                {}
                else {
                    let rNumber = Int.random(in: 1...10)
                    if rNumber < 5 {
                        imgHold[number!] = 0
                        UIView.animate(withDuration: 0.25,delay:0, animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                        })
                        tiles[number!].image = UIImage(named: "intro-wood.png")
                        UIView.animate(withDuration: 0.25,delay:0,animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                        })
                    }
                    else if rNumber > 4 && rNumber < 8 {
                        imgHold[number!] = 1
                        UIView.animate(withDuration: 0.25,delay:0, animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                        })
                        tiles[number!].image = UIImage(named: "intro-plastic.png")
                        UIView.animate(withDuration: 0.25,delay:0,animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                        })
                    }
                    else if rNumber > 7 && rNumber < 10 {
                        imgHold[number!] = 2
                        UIView.animate(withDuration: 0.25,delay:0, animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                        })
                        tiles[number!].image = UIImage(named: "intro-petrol.png")
                        UIView.animate(withDuration: 0.25,delay:0,animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                        })
                    }
                    else if rNumber > 9 && rNumber < 11 {
                        imgHold[number!] = 3
                        UIView.animate(withDuration: 0.25,delay:0, animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                        })
                        tiles[number!].image = UIImage(named: "intro-solar.png")
                        UIView.animate(withDuration: 0.25,delay:0,animations:{
                            self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                        })
                    }
                    checked.append(number!)
                }
            }
        }
        }
        else if currentLevel == 2{
            var rArray = [Int]()
            for i in 1...30 {
                rArray.append(i)
            }
            var checked = [Int]()
            for _ in 1...5{
                let number = rArray.randomElement()
                if number! != current {
                    if checked.firstIndex(of: number!) != nil
                    {}
                    else {
                        let rNumber = Int.random(in: 1...13)
                        if rNumber < 5 {
                            imgHold[number!] = 0
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-wood.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 4 && rNumber < 8 {
                            imgHold[number!] = 1
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-plastic.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 7 && rNumber < 10 {
                            imgHold[number!] = 2
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-petrol.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 9 && rNumber < 11 {
                            imgHold[number!] = 3
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-solar.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 10 && rNumber < 14 {
                            imgHold[number!] = 4
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-wasted.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        checked.append(number!)
                    }
                }
            }
        }
        else if currentLevel == 3 {
            var rArray = [Int]()
            for i in 1...30 {
                rArray.append(i)
            }
            var checked = [Int]()
            for _ in 1...5{
                let number = rArray.randomElement()
                if number! != current {
                    if checked.firstIndex(of: number!) != nil
                    {}
                    else {
                        let rNumber = Int.random(in: 1...15)
                        if rNumber < 5 {
                            imgHold[number!] = 0
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-wood.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 4 && rNumber < 10 {
                            imgHold[number!] = 1
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-plastic.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 9 && rNumber < 11 {
                            imgHold[number!] = 2
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-petrol.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 10 && rNumber < 12 {
                            imgHold[number!] = 3
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-solar.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 11 && rNumber < 15 {
                            imgHold[number!] = 4
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-wasted.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        else if rNumber > 12 && rNumber < 16 {
                            imgHold[number!] = 5
                            UIView.animate(withDuration: 0.25,delay:0, animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
                            })
                            tiles[number!].image = UIImage(named: "intro-aluminium.png")
                            UIView.animate(withDuration: 0.25,delay:0,animations:{
                                self.tiles[number!].transform = CGAffineTransform(scaleX: 1, y: 1)
                            })
                        }
                        checked.append(number!)
                    }
                }
            }
        }
    }
    func updateGoods(lindex: Int){
        if currentLevel == 1{
        if imgHold[lindex] == 0 {
            Trees += 20
        }
        else if imgHold[lindex] == 1 {
            Plastics += 1000
        }
        else if imgHold[lindex] == 2 {
            Petrol += 2000
        }
        else if imgHold[lindex] == 3 {
            Solar += 20
            let beginSound1 = Bundle.main.url(forResource: "solar", withExtension: "mp3")
            do{
                self.audioPlayer1 = try AVAudioPlayer(contentsOf: beginSound1!)
                self.audioPlayer1.volume = 1.0
            }
            catch {
                print(error)
            }
            audioPlayer1.play()
        }
        }
        else if currentLevel == 2 {
            if imgHold[lindex] == 0 {
                Trees += 2000
            }
            else if imgHold[lindex] == 1 {
                Plastics += 1000
            }
            else if imgHold[lindex] == 2 {
                Petrol += 2000
            }
            else if imgHold[lindex] == 3 {
                Solar += 200
                let beginSound1 = Bundle.main.url(forResource: "solar", withExtension: "mp3")
                do{
                    self.audioPlayer1 = try AVAudioPlayer(contentsOf: beginSound1!)
                    self.audioPlayer1.volume = 1.0
                }
                catch {
                    print(error)
                }
                audioPlayer1.play()
            }
            else if imgHold[lindex] == 4 {
                Waste += 100
            }
        }
        else if currentLevel == 3{
            if imgHold[lindex] == 0 {
                Trees += 10000
            }
            else if imgHold[lindex] == 1 {
                Plastics += 1000
            }
            else if imgHold[lindex] == 2 {
                Petrol += 2000
            }
            else if imgHold[lindex] == 3 {
                Solar += 200
                let beginSound1 = Bundle.main.url(forResource: "solar", withExtension: "mp3")
                do{
                    self.audioPlayer1 = try AVAudioPlayer(contentsOf: beginSound1!)
                    self.audioPlayer1.volume = 1.0
                }
                catch {
                    print(error)
                }
                audioPlayer1.play()
            }
            else if imgHold[lindex] == 4{
                Waste += 100
            }
            else if imgHold[lindex] == 5{
                Alloy += 100
            }
        }
    }
    func animateUp(source: Int, destination: Int){
        let Xpoint1 = tiles[source].frame.minX
        let Ypoint1 = tiles[source].frame.minY
        let Xpoint2 = tiles[destination].frame.minX
        let Ypoint2 = tiles[destination].frame.minY
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.hero.image = UIImage(named: "up1.png")
            self.hero.frame = CGRect(x: Xpoint1+20,y:Ypoint1+5,width:50,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.hero.image = UIImage(named: "up2.png")
            self.hero.frame = CGRect(x: Xpoint1+20,y:Ypoint1+5,width:35,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            self.hero.image = UIImage(named: "up2.png")
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.hero.frame.origin.y = Ypoint2+5
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.hero.image = UIImage(named: "up1.png")
            self.hero.frame = CGRect(x: Xpoint2+20,y:Ypoint2+5,width:50,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6){
            self.hero.image = UIImage(named: "normal.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:25,height: 60)
        }
    }
    func animateDown(source: Int, destination: Int){
        let Xpoint1 = tiles[source].frame.minX
        let Ypoint1 = tiles[source].frame.minY
        let Xpoint2 = tiles[destination].frame.minX
        let Ypoint2 = tiles[destination].frame.minY
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.hero.image = UIImage(named: "down1.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:25,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.hero.image = UIImage(named: "down2.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:25,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            self.hero.image = UIImage(named: "down2.png")
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.hero.frame.origin.y = Ypoint2+5
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.hero.image = UIImage(named: "down1.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:25,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6){
            self.hero.image = UIImage(named: "normal.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:25,height: 60)
        }
    }
    func animateRight(source: Int, destination: Int){
        let Xpoint1 = tiles[source].frame.minX
        let Ypoint1 = tiles[source].frame.minY
        let Xpoint2 = tiles[destination].frame.minX
        let Ypoint2 = tiles[destination].frame.minY
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.hero.image = UIImage(named: "right1.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            self.hero.image = UIImage(named: "right2.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.hero.image = UIImage(named: "right3.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:50,height: 30)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            self.hero.image = UIImage(named: "right3.png")
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.hero.frame.origin.x = Xpoint2+30
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.hero.image = UIImage(named: "right2.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.55){
            self.hero.image = UIImage(named: "right1.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6){
            self.hero.image = UIImage(named: "normal.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:25,height: 60)
        }
    }
    func animateLeft(source: Int, destination: Int){
        let Xpoint1 = tiles[source].frame.minX
        let Ypoint1 = tiles[source].frame.minY
        let Xpoint2 = tiles[destination].frame.minX
        let Ypoint2 = tiles[destination].frame.minY
        DispatchQueue.main.asyncAfter(deadline: .now()){
            self.hero.image = UIImage(named: "left1.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            self.hero.image = UIImage(named: "left2.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            self.hero.image = UIImage(named: "left3.png")
            self.hero.frame = CGRect(x: Xpoint1+30,y:Ypoint1+5,width:50,height: 30)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            self.hero.image = UIImage(named: "left3.png")
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.hero.frame.origin.x = Xpoint2+30
            }, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.hero.image = UIImage(named: "left2.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.55){
            self.hero.image = UIImage(named: "left1.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:45,height: 60)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6){
            self.hero.image = UIImage(named: "normal.png")
            self.hero.frame = CGRect(x: Xpoint2+30,y:Ypoint2+5,width:25,height: 60)
        }
    }
    func exitFunction(){
        self.removeFromSuperview()
        var level = EndView(scene: self, level: currentLevel, result: "")
        if currentLevel == 1{
        if Petrol <= 0 {
            level = EndView(scene: self, level: currentLevel, result: "Petrol")
        }
        else if Trees > 400 || Plastics > 10000 {
            level = EndView(scene: self, level: currentLevel, result: "Loss")
        }
        else {
            level = EndView(scene: self, level: currentLevel, result: "Win")
        }
        }
        else if currentLevel == 2{
            if Petrol <= 0 {
                level = EndView(scene: self, level: currentLevel, result: "Petrol")
            }
            else if Trees > 20000 || Plastics > 10000 {
                level = EndView(scene: self, level: currentLevel, result: "Loss")
            }
            else {
                level = EndView(scene: self, level: currentLevel, result: "Win")
            }
        }
        else if currentLevel == 3{
            if Petrol <= 0 {
                level = EndView(scene: self, level: currentLevel, result: "Petrol")
            }
            else if Trees > 100000 || Plastics > 10000 {
                level = EndView(scene: self, level: currentLevel, result: "Loss")
            }
            else {
                if Alloy > 0 {
                level = EndView(scene: self, level: currentLevel, result: "Win")
                }
                else {
                    level = EndView(scene: self, level: currentLevel, result: "Loss")
                }
            }
        }
        PlaygroundPage.current.liveView = level
    }
}
