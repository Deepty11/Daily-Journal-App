//
//  ContentView.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

extension View {
    func textFieldModifiers() -> some View {
        self.padding()
            .background(Color.gray.opacity(0.1))
            .background(RoundedRectangle(cornerRadius: 15,
                                         style: .continuous)
            .stroke(Color("yonderBlue"), lineWidth: 1))
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
                    ScrollView {
                        ForEach(Array(viewModel.messages.enumerated()), id: \.offset){ index, message in
                            Text(message.date)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .padding(.top, 10)
                            MessageView(message: message.text)
                                .padding(.trailing, 10)
                        }
                        .rotationEffect(.degrees(180))
                    }
                    .rotationEffect(.degrees(180))
                    
                
         
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
                    .padding(10)
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
