//
//  MessageEntity.swift
//  DJournal
//
//  Created by Rehnuma Reza(Deepty) on 10/1/24.
//

import Foundation

extension MessageEntity {
    convenience init(text: String) {
        self.id = UUID().uuidString
        self.text = text
        self.date = Date().format(with: "YYYY-MM-dd hh:mm")
    }
}
