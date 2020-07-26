//
//  ViewController.swift
//  PerfectSteakTimer

//  Created by Susanna Wu on 07/25/2020.
//  Copyright © 2020 Susanna Wu. All rights reserved.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let cookTimes = ["Rare": 240, "Medium": 300, "Well": 420]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var flipped = false
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = cookTimes[hardness]!

        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    
    @IBAction func StopButton(_ sender: UIButton) {
        secondsPassed = totalTime
        stopTimer()
        
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
            if flipped == false{
            titleLabel.text = "Your steak is ready to be flipped! Start timer for other side!"
            
            let url = Bundle.main.url(forResource: "bells", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            flipped = true}
            else {titleLabel.text = "Your steak is ready!"
                
                let url = Bundle.main.url(forResource: "bells", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
         
        }
        
        
    }

    

    @objc func stopTimer() {
          if secondsPassed < totalTime {
              secondsPassed += 1
              progressBar.progress = Float(secondsPassed) / Float(totalTime)
              print(Float(secondsPassed) / Float(totalTime))
          } else {
              timer.invalidate()
              titleLabel.text = "Timer is Stopped!"
              
              let url = Bundle.main.url(forResource: "bells", withExtension: "mp3")
              player = try! AVAudioPlayer(contentsOf: url!)
              player.play()
            
          }
          
          
      }
    

}
      
      
      


