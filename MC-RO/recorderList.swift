//
//  recorderList.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/22.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI

struct RecordingsList:View {
    @ObservedObject var audioRecorder: AudioRecorder
    
    var body: some View {
        List {
            ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
                RecordingRow(audioURL: recording.fileURL)
            }.onDelete(perform: delete)
        }.padding()
    }
    
    func delete(at offsets: IndexSet){
        var urlsToDelete = [URL]()
        for index in offsets {
            urlsToDelete.append(audioRecorder.recordings[index].fileURL)
        }
        audioRecorder.deleteRecording(urlsToDelete: urlsToDelete)
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View{
        RecordingsList(audioRecorder: AudioRecorder())
    }
}


struct RecordingRow: View {
    var audioURL: URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()
            if audioPlayer.isPlaying == false{
                Button(action: {
                    self.audioPlayer.startPlayback(audio: self.audioURL)
                }){
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                }
            }
            else{
                Button(action: {
                    self.audioPlayer.stopPlayback()
                }){
                    Image(systemName: "stop.fill")
                        .imageScale(.large)
                }
            }
        }
    }
}
