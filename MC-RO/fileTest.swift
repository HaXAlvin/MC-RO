//
//  fileTest.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/29.
//  Copyright © 2020 薛竣祐. All rights reserved.
//
import SwiftUI
import Combine

Text("Hello World")
.onTapGesture {
    let str = "Test Message"
    let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")

    do {
        try str.write(to: url, atomically: true, encoding: .utf8)
        let input = try String(contentsOf: url)
        print(input)
    } catch {
        print(error.localizedDescription)
    }
}
