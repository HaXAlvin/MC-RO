//
//  CircleImage.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/15.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var fileName:String
    var body: some View {
        Image(fileName)
            .resizable()
            .frame(width: 80, height: 80)
//            .frame(maxWidth:.infinity)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white,lineWidth:4)
            )
//            .shadow(radius:10)
            .scaledToFit()
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(fileName: "浪流連").previewLayout(.sizeThatFits)
    }
}
