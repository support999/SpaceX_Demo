//
//  Rocket_List.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 29/01/21.
//

import SwiftUI
import Foundation

struct RocketView: View {
    
    @ObservedObject var rocket_vm = Rocket_VM()
    
    var body: some View {
        
        NavigationView{
            
            List(rocket_vm.arrRocket){rocket in
                
                ActivityIndicator(animating: $rocket_vm.isLoaded, style: .medium)
                
                NavigationLink(destination: DetailsView(rocket: rocket)) {
                    RocketCell(rocket: rocket)
                }
            }
            .navigationTitle("Rockets")
        }
        .onAppear(){
            rocket_vm.fetch_Rockets()
        }
    }
}

struct Rocket_List_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
    }
}
