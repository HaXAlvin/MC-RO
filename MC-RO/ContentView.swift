//
//  ContentView.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/15.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
        TabView{
            NavigationView{
                FileView().navigationBarTitle("File")
            }.tabItem{
                TabViewButton(pictureName: "folder")
            }.tag(0).preferredColorScheme(.light)
            
            NavigationView{
                YoutubeView().navigationBarTitle("Youtube")
            }.tabItem{
                TabViewButton(pictureName: "youtube")
            }.tag(1).preferredColorScheme(.light)
            
            NavigationView{
                RecorderView(audioRecorder: AudioRecorder()).navigationBarTitle("microphone")
            }.tabItem{
                TabViewButton(pictureName: "microphone")
            }.tag(2).preferredColorScheme(.light)
        }
    }
}

struct FileView: View {
    var screenBound = UIScreen.main.bounds
    var songs:[Int:Song] = [
        0:Song(id: 0, singer: "茄子蛋", name: "浪流連", songPic: "浪流連",time: "05:04"),
        1:Song(id: 1, singer: "831", name: "小心肝", songPic: "831",time: "03:50")
    ]
    var songCount = 2
    
    var body: some View {
        VStack{
            List {
                ForEach((1...20), id: \.self) { (count) in
                    SongList(song:self.songs[count%2]!)
                }
                EmptyList()
            }
            ZStack{
                WaterView()
                Button(action: {
                    print("123")
                }){
                    Image("upload")
                        .resizable()
                        .padding()
                        .frame(width: 100, height: 100)
                        .opacity(0.5)
                }.buttonStyle(
                    PlainButtonStyle()
                )
            }
        }
    }
}

struct YoutubeView: View {
    var screenBound = UIScreen.main.bounds
    var songs:[Int:Song] = [
        0:Song(id: 0, singer: "茄子蛋", name: "浪流連", songPic: "浪流連",time: "05:04"),
        1:Song(id: 1, singer: "831", name: "小心肝", songPic: "831",time: "03:50")
    ]
    var songCount = 2
    @State private var URLOfYoutube = ""
    var body: some View {
        VStack{
            List {
                ForEach((1...20), id: \.self) { (count) in
                    SongList(song:self.songs[count%2]!)
                }
                EmptyList()
            }
            ZStack{
                WaterView()
                TextField("youtube連結",text: $URLOfYoutube)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                    .frame(width: 300, alignment: .center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
