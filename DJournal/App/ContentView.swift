//
//  ContentView.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

// MARK: View Builder for chat container
struct ChatContainerView<Content: View>: View {
    @ViewBuilder var content: () -> Content
   
    var body: some View {
        ScrollView {
            content()
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
    }
    
}

struct ContentView: View {
    @State var text: String = ""
    @State var isTextEmpty: Bool = true
    @StateObject var viewModel = ContentViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: Chat View
                ChatContainerView {
                    ForEach(Array(viewModel.messages.enumerated()), id: \.offset){ index, message in
                        SingleMessageView(message: message)
                    }
                }
                
                //MARK: TextField section
                HStack(alignment: .bottom) {
                    if #available(iOS 15, *) {
                        messageTextField()
                            .onSubmit { onSubmit() }
                        
                    } else {
                        messageTextField()
                    }
                    
                    Button {
                        onSubmit()
                    } label: {
                        Image(systemName: "paperplane.fill")
                            
                    }
                    .font(.system(size: 26))
                    .foregroundColor(text.isEmpty ? .secondary : Color("yonderBlue"))
                }
                .padding()
                
            }
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
    func messageTextField() -> some View {
        TextField("Write here", text: $text)
            .textFieldModifiers()
    }
    
    func onSubmit() {
        withAnimation(.easeIn) {
            if !text.isEmpty {
                viewModel.addMessage(text)
                text = ""
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
