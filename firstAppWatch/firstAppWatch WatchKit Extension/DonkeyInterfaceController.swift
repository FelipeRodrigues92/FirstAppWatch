//
//  DonkeyInterfaceController.swift
//  firstAppWatch
//
//  Created by Rachaus on 05/09/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import WatchKit
import Foundation


class DonkeyInterfaceController: WKInterfaceController {

    var player : WKAudioFilePlayer!
    var timer: Timer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(DonkeyInterfaceController.loadFirstController), userInfo: nil, repeats: false)
        
        let filePath = Bundle.main.path(forResource: "burro", ofType: "mp3")
        let fileUrl = NSURL.fileURL(withPath: filePath!)
        let asset = WKAudioFileAsset(url: fileUrl)
        let playerItem = WKAudioFilePlayerItem(asset: asset)
        self.player = WKAudioFilePlayer(playerItem: playerItem)
        
        player.play()
        
    }
    
    func loadFirstController() {
        timer.invalidate()
        popToRootController()
    }

}
