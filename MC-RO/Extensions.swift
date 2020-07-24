//
//  Extensions.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/23.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import Foundation

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}

