//
//  AddTodo.swift
//  ToDo App
//
//  Created by Administrator on 11/07/23.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("ToDo", text: $name)
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection:  $priority) {
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - Save Button
                    Button(action: {
                        print("Save a new todo item.")
                    }) {
                        Text("Save")
                    }//: Save Button
                }//: Form
                
                Spacer()
            } //: VStack
            .navigationBarTitle("New ToDo", displayMode: .inline)
        }//: Navigation
    }
}

// MARK: - PREVIEW
struct AddTodo_Previews: PreviewProvider {
    static var previews: some View {
        AddTodo()
    }
}
