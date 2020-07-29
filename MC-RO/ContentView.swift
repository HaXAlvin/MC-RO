//
//  ContentView.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/15.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI
import Combine
import UIKit
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
                RecorderView(audioRecorder: AudioRecorder()).navigationBarTitle("Record")
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
                fileUpload()
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
    @State private var keyboardHeight: CGFloat = 0
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
                VStack{
                    TextField("youtube連結",text: $URLOfYoutube)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                        .frame(width: 300, alignment: .center)
                    Button(action: {
                        print("解析youtube")
                    }){
                        Text("解析")
                            .font(.system(size: 18))
                            .foregroundColor(Color.init(hex: "#fffff5", alpha: 1.0))
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.init(hex: "#fffff5", alpha: 1.0), lineWidth: 2)
                        )
                    }
                }
            }
        }.padding()
            .padding(.bottom, keyboardHeight)
            .onReceive(Publishers.keyboardHeight){
                self.keyboardHeight = $0 - 18
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
