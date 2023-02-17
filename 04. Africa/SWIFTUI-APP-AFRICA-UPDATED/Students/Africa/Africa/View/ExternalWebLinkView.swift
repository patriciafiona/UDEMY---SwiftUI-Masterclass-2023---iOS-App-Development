//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Other on 17/02/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: - PROPERTIES
    let animal: Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }//: Group
                .foregroundColor(.accentColor)
            }//: HStack
        }//: GroupBox
    }
}

//MARK: - PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
