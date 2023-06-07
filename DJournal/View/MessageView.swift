//
//  MessageView.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

struct MessageView: View {
    var message: String
    
    func createBasicTextField(with message: String) -> some View {
        Text(message)
            .padding()
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
    }
    
    
    var body: some View {
        HStack {
            Spacer()
            if #available(iOS 15.0, *) {
                createBasicTextField(with: message)
                    .background(.blue)
                    .cornerRadius(20)
            } else {
                createBasicTextField(with: message)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.blue, .blue]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .cornerRadius(20)
            }
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "I think I've seen this film before And I didn't like the ending I'm not your problem anymore So who am I offending now?")
            .previewLayout(.sizeThatFits)
    }
}
