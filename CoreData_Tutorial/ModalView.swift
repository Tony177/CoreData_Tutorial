//
//  ModalView.swift
//  CoreData_Tutorial
//
//  Created by Antonio Avolio on 28/11/22.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var viewModel : ViewModel
    @State private var title : String = ""
    @State private var desc : String = ""
    @Binding var onModal : Bool
    var body: some View {
        Form{
            Section("Title"){
                TextField("Title", text: $title)
            }
            Section("Decription"){
                TextField("Description", text: $desc)
            }
            Button {
                addNote()
                title = ""
                desc = ""
                onModal = false
            } label: {
                Text("Add note")
            }

        }
    }
    func addNote() -> Void{
        let note = Item(context: viewContext)
        note.id = UUID()
        note.body = desc
        note.title = title
        note.timestamp = Date()
        viewModel.saveDB(context: viewContext)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(onModal: .constant(true))
    }
}
