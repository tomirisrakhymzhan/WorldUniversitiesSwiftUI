//
//  LabelView.swift
//  WorldUniversitiesSwiftUI
//
//  Created by Томирис Рахымжан on 23/07/2024.
//

import SwiftUI

struct LabelView: View {
    let text: String
    let textColor: Color
    let color: Color
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(text: "mjb", textColor: .white, color: .teal)
    }
}
