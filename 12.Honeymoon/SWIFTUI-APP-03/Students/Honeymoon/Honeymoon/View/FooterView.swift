//
//  FooterView.swift
//  Honeymoon
//
//  Created by Administrator on 20/07/23.
//

import SwiftUI

struct FooterView: View {
    // MARK: - Properties
    @Binding var showBookingAlert: Bool
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button(action: {
                self.showBookingAlert.toggle()
            }) {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(.pink)
                    .background(Capsule().stroke(.pink, lineWidth: 2))
            }
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
            
        }
        .padding()
    }
}

// MARK: - Footer
struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
