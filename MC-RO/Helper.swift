//
//  Helper.swift
//  MC-RO
//
//  Created by chuanlin on 2020/7/23.
//  Copyright © 2020 薛竣祐. All rights reserved.
//

import Foundation
func getCreationDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}
