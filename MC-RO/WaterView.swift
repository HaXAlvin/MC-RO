//
//  WaterView.swift
//  MC-RO
//
//  Created by 薛竣祐 on 2020/7/18.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import SwiftUI

struct WaterView: View {
    var body: some View {
        // try sin
        Path{ (path) in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(
                to: CGPoint(x: UIScreen.screenWidth/2, y: 0),
                control: CGPoint(x: UIScreen.screenWidth/4, y: -100)
            )
            path.addQuadCurve(
                to: CGPoint(x: UIScreen.screenWidth, y: 0),
                control: CGPoint(x: UIScreen.screenWidth/4*3, y: 100)
            )
            path.addLine(to: CGPoint(x: UIScreen.screenWidth, y: UIScreen.screenHeight))
            path.addLine(to: CGPoint(x: 0, y: UIScreen.screenHeight))
        }
        .fill(Color.blue)
        .frame(width: UIScreen.screenWidth, height:UIScreen.screenHeight/4-50)
        .offset(x: 0, y: -50)
    }
        
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
//        WaterView()
        WaterView().previewLayout(.sizeThatFits)
//        WaterView().previewLayout(.fixed(width: 400, height: 500))
    }
}
