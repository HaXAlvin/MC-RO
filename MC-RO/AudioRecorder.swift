//
//  AudioRecorder.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/22.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

class AudioRecorder: NSObject,ObservableObject {
    
    override init() {
        super.init()
        fetchRecording()
    }
    
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    
    var audioRecorder: AVAudioRecorder!
    var recordings = [Recording]()
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    //開始錄音
    func startRecording(){
        let recordingSession = AVAudioSession.sharedInstance()
        do{
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        }
        catch{
            print("Failed to set up recording session.")
        }
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        let setting = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: setting)
            audioRecorder.record()
            
            recording = true
        }catch{
            print("Could not start recording.")
        }
    }
    
    func stopRecording(){
        audioRecorder.stop()
        recording = false
        
        fetchRecording()
        //更新錄音檔列表
    }
    
    func fetchRecording(){
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio))
            recordings.append(recording)
        }
            
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
        objectWillChange.send(self)
    }
    
    func deleteRecording(urlsToDelete: [URL]){
        for url in urlsToDelete{
            print(url)
            do{
                try FileManager.default.removeItem(at: url)
            }catch{
                print("File could not be deleted")
            }
        }
        fetchRecording()
    }
}



struct RecorderView: View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        VStack{
            RecordingsList(audioRecorder: audioRecorder)
            if audioRecorder.recording == false {
                ZStack{
                    WaterView()
                    Button(action: {self.audioRecorder.startRecording()}){
                        Image(systemName: "circle.fill")
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                        .offset(y: 20)
                    }
                }
            }
            else {
                ZStack{
                    WaterView()
                    Button(action:{self.audioRecorder.stopRecording()}){
                        Image(systemName: "stop.fill")
                        .resizable()
                            .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipped()
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                        .offset(y: 20)
                    }
                }
            }
        }
    }
}

struct RecorderView_Previews: PreviewProvider {
    static var previews: some View{
                RecorderView(audioRecorder: AudioRecorder())
    }
}

let recorderView = RecorderView(audioRecorder: AudioRecorder())
