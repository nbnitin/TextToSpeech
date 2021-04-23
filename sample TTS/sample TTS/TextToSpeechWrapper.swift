//
//  TextToSpeechWrapper.swift
//  sample TTS
//
//  Created by Nitin Bhatia on 4/21/21.
//

import AVKit

class TextToSpeechWrapper {
    let synthesizer: AVSpeechSynthesizer? =  AVSpeechSynthesizer()
    private var utterance: AVSpeechUtterance!
    
    //Creating this singleton and selectedRow property to handle Bookmark TextToSpeech functionality.
    static let shared =  TextToSpeechWrapper()
    var selectedRow: Int = -1
    var currentVoice : String = String()
    var rate = CGFloat()
    var pitch = CGFloat()
    
    private init() {
        
    }
    
    func getAllSpeechVoices()->[AVSpeechSynthesisVoice] {
        return AVSpeechSynthesisVoice.speechVoices()
    }
    
    func configure(string: String) {
        utterance = nil
        utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(identifier: currentVoice)
        utterance.rate = Float(rate)
        utterance.pitchMultiplier = Float(pitch)
        debugPrint(AVSpeechSynthesisVoice.speechVoices())
    }

    func isSpeaking() -> Bool {
        return synthesizer?.isSpeaking ?? false
    }
    
    func isPaused() -> Bool {
        return  synthesizer?.isPaused ?? false
    }
    
    func startSpeaking() {
        while true {
            if !isSpeaking() {
                break
            }
            stopSpeaking()
        }
        if utterance == nil {
            return
        }
        synthesizer?.speak(utterance)
    }
    
    func pauseSpeaking() {
        synthesizer?.pauseSpeaking(at: .immediate)
    }
    
    func continueSpeaking() {
        synthesizer?.continueSpeaking()
    }
    
    func stopSpeaking() {
        synthesizer?.stopSpeaking(at: .immediate)
    }
    
    func toggleSpeaking () {
        guard let synthesizer = synthesizer else {
            return
        }
        if !synthesizer.isSpeaking {
            startSpeaking()
        } else if synthesizer.isPaused {
            continueSpeaking()
        } else {
            pauseSpeaking()
        }
    }
    
    func deinitialize() {
        utterance = nil
//        TextToSpeechWrapper.synthesizer = nil
    }
    
    deinit {
        deinitialize()
        debugPrint("TextToSpeechWrapper Deinit called")
    }
}
