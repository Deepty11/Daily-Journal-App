//
//  ChatView.swift
//  DJournal
//
//  Created by Rehnuma Reza(Deepty) on 10/1/24.
//

import SwiftUI

struct SingleMessageView: View {
    var message = MessageModel(text: "")
    
    var body: some View {
        Text(message.date)
            .font(.footnote)
            .foregroundColor(.secondary)
            .padding(.top, 10)
        MessageView(message: message.text)
            .padding(.trailing, 10)
    }
}

#Preview {
    SingleMessageView()
}
