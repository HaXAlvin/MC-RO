//
//  SongClass.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/19.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

class Song{
    var id:Int = -1
    var singer:String = ""
    var name:String = ""
    var songPic:String = ""
    var time:String = ""
    init(id:Int,singer:String?=nil,name:String?=nil,songPic:String?=nil,time:String?=nil) {
        self.id = id
        self.singer = (singer == nil ? "未知的演唱者" : singer)!
        self.name = (name == nil ? "未知的歌曲" : name)!
        self.songPic = (songPic == nil ? "default" : songPic)!
        self.time = (time == nil ? "00:00" : time)!
    }
}
