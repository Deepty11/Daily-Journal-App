//
//  CustomLinearGradient.swift
//  DJournal
//
//  Created by Rehnuma Reza on 9/6/23.
//

import SwiftUI

struct CustomLinearGradient: View {
    var fromColor: Color
    var toColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [fromColor, toColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
    }
}

struct CustomLinearGradient_Previews: PreviewProvider {
    static var previews: some View {
        CustomLinearGradient(fromColor: .blue,
                             toColor: .white)
    }
}
