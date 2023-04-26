//
//  InfoView.swift
//  Slot Machine
//
//  Created by Administrator on 26/04/23.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the Application")) {
                    FormRow(firstItem: "Application", secondItem: "Slot Machine")
                    FormRow(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    FormRow(firstItem: "Developer", secondItem: "Patricia Fiona")
                    FormRow(firstItem: "Designer", secondItem: "Robert Petras")
                    FormRow(firstItem: "Music", secondItem: "Dan Lebowitz")
                    FormRow(firstItem: "Website", secondItem: "https://github.com/patriciafiona")
                    FormRow(firstItem: "Copyright", secondItem: "© 2020 All rights reserved.")
                    FormRow(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary),
            alignment: .topTrailing
        )
    }
}

struct FormRow: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
