//
//  ContentViewVM.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import Foundation
import SwiftUI

class ContentViewVM: ObservableObject {
    @Published var messages: [MessageModel] = []
    @Environment(\.managedObjectContext) var context
    
    init() {
        loadInitialMessages()
    }
    
    func addMessage(_ text: String) {
        saveMessage(text)
        
        messages.append(MessageModel(text: text))
    }
    
    func loadInitialMessages() {
        _ = MessageStrings.messages.map { messages.append(MessageModel(text: $0)) }
    }
    
    func saveMessage(_ text: String) {
        let message = MessageEntity(context: context)
        message.id = UUID().uuidString
        message.text = text
        message.date = Date().format(with: "YYYY-MM-dd hh:mm:ss")
        
        do {
            try context.save()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
