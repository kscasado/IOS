//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Kevin Casado on 6/21/16.
//  Copyright © 2016 Kevin Casado. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController , AVAudioRecorderDelegate {

    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    var audioRecorder : AVAudioRecorder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func recordAudio(sender: AnyObject) {
        recordButton.enabled=false
        recordingLabel.text="Recording in progress"
        stopRecordingButton.enabled=true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }

    @IBAction func stopRecording(sender: AnyObject) {
        recordButton.enabled=true
        recordingLabel.text="Stopped Recording"
        stopRecordingButton.enabled=false
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled=false
    }
    func audioRecorderDidFinishRecording(recorder : AVAudioRecorder, successfully flag: Bool){
        print("AVAudioRecorder finished")
        if(flag){
                self.performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }
        else{
            print("recording failed to save")
        }
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            if (segue.identifier == "stopRecording") {
                let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
                let recordedAudioURL = sender as! NSURL
                playSoundsVC.recordedAudioURL = recordedAudioURL
            }
        
    }
    
}

