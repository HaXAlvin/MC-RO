//
//  SongList.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/18.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI

struct SongList: View {
    var song:Song
    let heart = [Image("heart"),Image("heart-fill")]
    let play = [Image("unplay-button"),Image("stop")]
    @State var nowHeart = 0
    @State var nowPlay = 0
    var body: some View {
        HStack{
            CircleImage(fileName:song.songPic)
            VStack(alignment:.center,spacing:10){
                HStack(alignment: .bottom){
                    Text(song.name)
                        .font(.title)
                    Text(song.time)
                        .font(.headline)
                    Spacer()
                    Button(action:{
                        self.nowPlay = self.nowPlay == 1 ? 0 : 1
                    }){
                        play[nowPlay]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                    }.buttonStyle(PlainButtonStyle())
                }
                HStack(alignment: .top){
                    Text(song.singer)
                        .font(.subheadline)
                    Spacer()
                    Button(action:{
                        print(123)
                    }){
                        
                        Image("sheet")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                    }.buttonStyle(PlainButtonStyle())
                    Button(action:{
                        self.nowHeart = self.nowHeart == 1 ? 0 : 1
                    }){
                        heart[nowHeart]
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList(song: Song(id: -1)).previewLayout(.sizeThatFits)
    }
}

