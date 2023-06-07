//
//  MessageModel.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import Foundation

extension Date {
    func format(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

struct MessageModel: Identifiable {
    var id =  UUID().uuidString
    var date: String  = Date().format(with: "YYYY-MM-dd hh:mm")
    var text: String
}
