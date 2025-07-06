//
//  Recorder.swift
//  AudioRecorderTranscriptor
//
//  Created by Adrian Reyes on 7/4/25.
//

import Foundation
import AVFoundation


// 1. request permission
// 2. set category
// 3. set active
// 4. handle interruptions if necessary

class Recorder {
    private var engine: AVAudioEngine?
    private var outputDoc: AVAudioFile?
    
   
    func reqPermission() {
        
        AVAudioApplication.requestRecordPermission { granted in
            if granted {
                DispatchQueue.main.async {
                    self.setupAudioSession()
                }
            }else {
                DispatchQueue.main.async {
                    print("Microphone acess denied.")
                }
            }
        }
    }
    
    
    
    
    
   // configure audio session
    // AVAudioSession.sharedInstance() allows to configure
    // apps intention and use of audio
    // and activate our session
    // catch to push out error incase it fails to setup our session
    func setupAudioSession() {
        let session = AVAudioSession.sharedInstance()
    
        do {
            
            try session.setCategory(.playAndRecord, mode: .default)
            
            try session.setActive(true)
        }catch {
            print("Failure to setup session category \(error)")
        }
        
    }
    
    
    // func to play back audio
    // attach player node to the engine
    // connect player to mainMixerNode which connects to engine default output node which is iOS device speaker
    //choose where audio file will be saved
    func playAudio(){
        // instance of AVAudioEngine()
        // attach player to engine
        let engine = AVAudioEngine()
        let player = AVAudioPlayerNode()
        
        
        engine.attach(player)
        engine.connect(player, to: engine.mainMixerNode, format: nil)
        
        
        let audioDocPath = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("recording.caf")
        
        
        do{
            let audFile = try AVAudioFile(forReading: audioDocPath)
            try engine.start()
            player.scheduleFile(audFile, at: nil)
            player.play()
            print("Replay started ")
        }catch{
            print("Error replaying audio: \(error)")
        }
    }
    
    
    func startRecording() {
        
        engine = AVAudioEngine()
        guard let engine = engine else { return}
        
        let audioDocPath = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            
        
        let fileAudioName = audioDocPath.appendingPathComponent("recording.caf")
        
      
        
        
        
    }
    
  

}
