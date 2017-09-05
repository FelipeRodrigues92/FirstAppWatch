//
//  InterfaceController.swift
//  firstAppWatch WatchKit Extension
//
//  Created by Felipe Rodrigues on 04/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var player : WKAudioFilePlayer!
    var country : Country!
    @IBOutlet var quizButton: WKInterfaceButton!
    var timer: Timer!
    
    @IBAction func playSound() {
        player.play()
        
        animate(withDuration: 5) {
            self.quizButton.setAlpha(1)
        }
    }
    
    @IBAction func goToQuiz() {
        player.pause()
        self.pushController(withName: "quiz", context: country)
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func didAppear() {
        let randomIndex = Int(arc4random_uniform(UInt32(4)))
        country = Country(rawValue: randomIndex)!
        
        let filePath = Bundle.main.path(forResource: country.anthem, ofType: "mp3")
        let fileUrl = NSURL.fileURL(withPath: filePath!)
        let asset = WKAudioFileAsset(url: fileUrl)
        let playerItem = WKAudioFilePlayerItem(asset: asset)
        self.player = WKAudioFilePlayer(playerItem: playerItem)
    }

}
