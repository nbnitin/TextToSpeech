//
//  ViewController.swift
//  sample TTS
//
//  Created by Nitin Bhatia on 4/21/21.
//

import UIKit
import AVKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var lblRate: UILabel!
    @IBOutlet var lblPitch: UILabel!
    @IBOutlet var tbl: UITableView!
    @IBOutlet var rateSlider: UISlider!
    @IBOutlet var pitchSlider: UISlider!
    
    var data : [AVSpeechSynthesisVoice] = TextToSpeechWrapper.shared.getAllSpeechVoices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rateSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        rateSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
        pitchSlider.minimumValue = 0.5
        pitchSlider.maximumValue = 2
        
        rateSlider.value = 0.4
        lblRate.text = "Rate 0.4"
        TextToSpeechWrapper.shared.rate = CGFloat(rateSlider.value)
        
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        cell.detailTextLabel?.text = data[indexPath.row].language
        return cell        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TextToSpeechWrapper.shared.currentVoice = data[indexPath.row].identifier
        performSegue(withIdentifier: "goToText", sender: nil)
    }
    
    @IBAction func rateSliderAction(_ sender: Any) {
        lblRate.text = "Rate " + "\(rateSlider.value)"
        TextToSpeechWrapper.shared.rate = CGFloat(rateSlider.value)
    }
    
    @IBAction func pitchSliderAction(_ sender: Any) {
        lblPitch.text = "Pitch " + "\(pitchSlider.value)"
        TextToSpeechWrapper.shared.pitch = CGFloat(pitchSlider.value)
    }
}

