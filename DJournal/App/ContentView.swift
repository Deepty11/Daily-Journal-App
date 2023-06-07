//
//  ContentView.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

extension View {
    @available(iOS 15.0, *)
    func textFieldModifiersFor15AndAbove() -> some View {
        self.textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.blue, lineWidth: 1)
            }
    }
}
struct ContentView: View {
    @State var text: String = ""
    @State var isTextEmpty: Bool = true
    @StateObject var viewModel = ContentViewVM()
    
    init() {
        prepareNavigationAppearance()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                //MARK: Chat View
               ScrollView {
                    ForEach(viewModel.messages) { message in
                        Text(message.date)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)
                        MessageView(message: message.text)
                            .padding(.trailing, 10)
                    }
                }
         
                //MARK: TextField section
                HStack(alignment: .bottom) {
                    if #available(iOS 15.0, *) {
                        TextField("Write here", text: $text)
                            .textFieldModifiersFor15AndAbove()
                            .frame(minHeight: 30)
                    } else {
                        HStack {
                            TextField("Write here", text: $text)
                                .frame(minHeight: 30)
                            
                        }
                        .textFieldStyle(OvalTextFieldStyle())
                    }
                    
                    Button {
                        withAnimation(.linear) {
                            if !text.isEmpty {
                                viewModel.addMessage(text)
                                text = ""
                            }
                            
                        }
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(text.isEmpty ? .secondary : .blue)
                    }
                    
                }
                .frame(minWidth: 50)
                .padding()
                
            }
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
    func prepareNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(.blue)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
