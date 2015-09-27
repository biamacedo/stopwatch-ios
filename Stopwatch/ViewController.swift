//
//  ViewController.swift
//  Stopwatch
//
//  Created by BEATRIZ MACEDO on 9/27/15.
//  Copyright © 2015 Beatriz Macedo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = NSTimer()
    
    var time = 0
    
    @IBAction func play(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
        
    }

    @IBAction func reset(sender: AnyObject) {
        
        timer.invalidate()
        
        time = 0
        
        timerLabel.text = "00:00:00"
        
    }
    
    let formatter = NSNumberFormatter()
    
    func increaseTimer(){
        
        time++
        
        let (hour, minute, second) = secondsToHoursMinutesSeconds(time)
        
        timerLabel.text = "\(formatter.stringFromNumber(hour)!):\(formatter.stringFromNumber(minute)!):\(formatter.stringFromNumber(second)!)"
        
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
        return (seconds/3600, (seconds%3600)/60, (seconds%3600)%60)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.minimumIntegerDigits = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

