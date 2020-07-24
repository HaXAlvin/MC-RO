//
//  TabViewButton.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/21.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI

struct TabViewButton: View {
    var pictureName:String
    var body: some View {
        VStack{
            Image(pictureName)
                .resizable()
                .frame(width: 50,height: 50)
                .scaledToFit()
                .opacity(0.5)
            Text(pictureName)
        }
    }
}

struct TabViewButton_Previews: PreviewProvider {
    static var previews: some View {
        TabViewButton(pictureName: "youtube" ).previewLayout(.sizeThatFits)
    }
}
