//
//  Extension + String.swift
//  TestPodborAuto.SUI
//
//  Created by Igor on 09.08.2023.
//

import Foundation
extension String {
    func formattedString() -> String {
        let reversedString = String(self.reversed())
               let regex = try! NSRegularExpression(pattern: "(.{1,3})(?!$)", options: [])
               let range = NSRange(location: 0, length: reversedString.count)
               let formattedString = regex.stringByReplacingMatches(in: reversedString, options: [], range: range, withTemplate: "$1 ")
               return String(formattedString.reversed())
    }
}

