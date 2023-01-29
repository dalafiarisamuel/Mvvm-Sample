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
            }
            .listStyle(.plain)
            .background(.thinMaterial)
            
            Button("add item"){
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
