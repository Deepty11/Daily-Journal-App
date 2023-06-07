//
//  ContentViewVM.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import Foundation

class ContentViewVM: ObservableObject {
    @Published var messages: [MessageModel] = []
    
    init() {
        loadInitialMessages()
    }
    
    func addMessage(_ text: String) {
        messages.append(MessageModel(text: text))
    }
    
    func loadInitialMessages() {
        _ = MessageStrings.messages.map { messages.append(MessageModel(text: $0)) }
    }
}
