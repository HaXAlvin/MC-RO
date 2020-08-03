//
//  seperateSound.swift
//  MC-RO
//
//  Created by chuanlin on 2020/8/3.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import Foundation
import SwiftUI

struct seperateList: View {
    var seperateSongs:[Int:Song] = [
        0:Song(id: 0, singer: "茄子蛋", name: "vocals", songPic: "浪流連",time: "05:04"),
        1:Song(id: 1, singer: "831", name: "piano", songPic: "831",time: "03:50"),
        2:Song(id: 2, singer: "茄子蛋", name: "bass", songPic: "浪流連",time: "05:04"),
        3:Song(id: 3, singer: "831", name: "drums", songPic: "831",time: "03:50"),
        4:Song(id: 4, singer: "831", name: "other", songPic: "831",time: "03:50"),
    ]
    var body: some View{
        VStack{
            List {
                ForEach((0...4), id: \.self) { (count) in
                    SongList(song:self.seperateSongs[count%5]!)
                }
                EmptyList()
            }
            ZStack{
                WaterView()
                fileUpload()
            }
        }.navigationBarTitle(Text("Seperated Sound"), displayMode: .inline)
    }
}

struct SeperateSound_Previews: PreviewProvider {
    static var previews: some View {
        seperateList()
    }
}
