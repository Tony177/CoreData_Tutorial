//
//  ContentView.swift
//  CoreData_Tutorial
//
//  Created by Antonio Avolio on 28/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var viewModel : ViewModel
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)],
        animation: .default) var items: FetchedResults<Item>
    @State var onModal : Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    VStack{
                        NavigationLink {
                            NoteView(item: item)
                        } label: {
                            VStack(alignment: .leading){
                                Text(item.title)
                                Text(item.body).frame(height:10).truncationMode(.tail)
                                Text(item.timestamp.formatted())
                            }
                            
                        }

                        
                    }
                }.onDelete(perform: deleteItem)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        onModal = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }.sheet(isPresented: $onModal) {
            ModalView(onModal:$onModal)
        }
    }
    func deleteItem(at offset: IndexSet) -> Void{
        viewContext.delete(items[offset.last!])
        viewModel.saveDB(context: viewContext)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
