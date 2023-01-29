//
//  ContentView.swift
//  Mvvm Sample
//
//  Created by Samuel Dalafiari on 28/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        VStack {
            Toggle("Toggle switch", isOn: $vm.isTurnedOn).padding()

            HStack {
                Button("Increment") {
                    vm.increment()
                }
                Text("\(vm.counter)")
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
            }
            List(vm.itemList) { item in

                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.description)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        vm.deleteItem(item: item)
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
                .swipeActions (edge: .leading) {
                    Button {
                        
                    } label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    .tint(.green)
                }
                .padding()
            }
            .listStyle(.plain)
            .background(.thinMaterial)

            Button("add item") {
                vm.addItem()
            }
            .buttonStyle(.bordered)
            .disabled(!vm.isTurnedOn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
