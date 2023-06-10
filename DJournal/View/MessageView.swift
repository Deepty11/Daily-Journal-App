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
            createBasicTextField(with: message)
                .background(
                    CustomLinearGradient(fromColor: Color("yonderBlue"),
                                         toColor: Color("glaucousBlue"))
                )
                .cornerRadius(20)
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "I think I've seen this film before And I didn't like the ending I'm not your problem anymore So who am I offending now?")
            .previewLayout(.sizeThatFits)
    }
}
