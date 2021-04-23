//
//  TextViewController.swift
//  sample TTS
//
//  Created by Nitin Bhatia on 4/21/21.
//

import UIKit
import AVFoundation

class TextViewController: UIViewController {
    var textToSpeech: TextToSpeechWrapper? = TextToSpeechWrapper.shared

    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textToSpeechWithDelgate(text: textView.text ?? "", viewController: self)
        textToSpeech?.toggleSpeaking()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        textToSpeech?.stopSpeaking()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: extension function for speech
extension TextViewController: AVSpeechSynthesizerDelegate {
    
    private func textToSpeechWithDelgate(text: String, viewController: AVSpeechSynthesizerDelegate) {
        textToSpeech?.configure(string: text)
        textToSpeech?.synthesizer?.delegate = self
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        
    }
    
    //MARK: this will help to reset speech related when app goes to background, while speech is going on or system reading the content, and opens the app from background
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        
    }
}

