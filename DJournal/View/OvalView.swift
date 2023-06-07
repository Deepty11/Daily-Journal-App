//
//  OvalView.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View{
        configuration
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.blue, lineWidth: 1))
            .cornerRadius(20)
    }
}


