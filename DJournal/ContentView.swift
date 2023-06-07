//
//  ContentView.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var messages: [String] = ["hello",
                                     "This is me Rehnuma",
                                     "This is an app where you can add your daily journal",
                                     "you can post it here what you experience",
                                     "Initially this only supports text based journal",
                                     "Enjoy! :)"]

    @State var text: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(messages, id: \.self) { message in
                        Text(message)
                    }
                }
                .background(.white)
                
                HStack(alignment: .bottom) {
                    TextField("Write here", text: $text)
                        .textFieldStyle(.roundedBorder)
                        .frame(minHeight: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(.blue, lineWidth: 1)
                        }
                        
                    
                    Button {
                        //
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                    }
                    
                }
                .frame(minWidth: 50)
                .padding()
                
            }
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
