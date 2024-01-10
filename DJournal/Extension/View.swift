//
//  View.swift
//  DJournal
//
//  Created by Rehnuma Reza(Deepty) on 10/1/24.
//

import Foundation
import SwiftUI

extension View {
    func textFieldModifiers() -> some View {
        self
            .background(Color.gray.opacity(0.1))
            .padding(2)
            .textFieldStyle(.roundedBorder)
    }
}
