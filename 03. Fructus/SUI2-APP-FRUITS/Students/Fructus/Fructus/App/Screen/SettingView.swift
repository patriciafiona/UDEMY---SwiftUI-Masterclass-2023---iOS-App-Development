//
//  SettingView.swift
//  Fructus
//
//  Created by Other on 15/02/23.
//

import SwiftUI

struct SettingView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    //MARK: - SECTION 1
                    GroupBox(label: SettingLabelView(labelText: "Fructus", labelImage: "info.circle")) {
                        Divider().padding(.vertical, 4)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("More fruits are naturally low in fat, sodium, and calories. None have cholestrol. Fruits are sources of many essential nutrients, including potasium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                                .padding(.leading, 10)
                        }
                    }
                    
                    //MARK: - SECTION 2
                    
                    //MARK: - SECTION 3
                    GroupBox(
                        label: SettingLabelView(labelText: "Application", labelImage: "app.iphone")) {
                            SettingRowView(name: "Developer", content: "FIONA, patricia")
                            SettingRowView(name: "Designer", content: "Robert Petras")
                            SettingRowView(name: "Compatibility", content: "iOS 15.2")
                            SettingRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                            SettingRowView(name: "Github", linkLabel: "Github Patricia Fiona", linkDestination: "github.com/patriciafiona")
                            SettingRowView(name: "Version", content: "1.0.0")
                    }
                    
                }//: - Vstack
                .navigationBarTitle(
                    Text("Settings"),
                    displayMode: .large
                )
                .navigationBarItems(
                    trailing:
                        Button (action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }//: Scroll
        }//: Navigation
    }
}

//MARK: - PREVIEW
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .preferredColorScheme(.dark)
    }
}
