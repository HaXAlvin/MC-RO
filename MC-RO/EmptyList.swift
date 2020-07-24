//
//  EmptyList.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/18.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI

struct EmptyList: View {
    var body: some View {
        HStack(alignment: .center,spacing: UIScreen.screenWidth/4){
            Text("🥺")
                .font(.system(.largeTitle))
            Text("不要再往下拉了")
        }.frame(width: UIScreen.screenWidth, height: 83.5, alignment: .center)
//        HStack(alignment:.center){
//            Rectangle()
//                .fill(Color.white)
//                .frame(width: UIScreen.screenWidth, height: 83.5)
////            Divider()
////            Text("Empty")
//        }
    }
}

struct EmptyList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyList().previewLayout(.fixed(width: UIScreen.screenWidth, height: 83.5))
    }
}
