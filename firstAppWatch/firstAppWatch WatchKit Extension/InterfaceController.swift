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
    
    @IBAction func playSound() {
        player.play()
    }
    @IBAction func goToQuiz() {
        player.pause()
        self.pushController(withName: "QuizInterfaceController", context: country)
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var randowIndex = Int(arc4random_uniform(UInt32(4)))
        country = Country(rawValue: randowIndex)!
        
        let filePath = Bundle.main.path(forResource: country.anthem, ofType: "mp3")
        let fileUrl = NSURL.fileURL(withPath: filePath!)
        let asset = WKAudioFileAsset(url: fileUrl)
        var playerItem = WKAudioFilePlayerItem(asset: asset)
         self.player = WKAudioFilePlayer(playerItem: playerItem)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
