//
//  NoteView.swift
//  CoreData_Tutorial
//
//  Created by Antonio Avolio on 29/11/22.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var viewModel : ViewModel
    @State var item : Item
    
    var body: some View {
        VStack(alignment:.center){
            TextField("Title",text:$item.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Description",text:$item.body,axis:.vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            Button {
                item.timestamp = Date()
            viewModel.saveDB(context: viewContext)
            } label: {
                Text("Update Note")
                
            }.buttonStyle(.bordered)
            
        }.padding()
           
    }
}
