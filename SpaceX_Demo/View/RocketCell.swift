//
//  Rocket_Cell.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 30/01/21.
//

import SwiftUI
import Foundation

struct RocketCell: View {
    
    let rocket:RocketModel
    
    var body: some View {
        
        HStack{
            RemoteImage(url: rocket.flickr_images?[0] ?? "")
            VStack(alignment: .leading){
                HStack{
                    Text(rocket.name?.uppercased() ?? "")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    
                    let s_rate = rocket.success_rate_pct ?? 0
                    if (s_rate >= 60) && (s_rate <= 100){
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 15, height: 15, alignment: .leading)
                    }
                    else if (s_rate >= 30) && (s_rate <= 59){
                        Circle()
                            .foregroundColor(.orange)
                            .frame(width: 15, height: 15, alignment: .leading)
                        
                    }else if (s_rate >= 0) && (s_rate <= 29){
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 15, height: 15, alignment: .leading)
                    }
                    else{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15, alignment: .leading)
                    }
                }
                Text(rocket.company ?? "")
                Text(rocket.first_flight ?? "")
                
            }.padding(20)
            
        }.onAppear(){
            SpaceXApiConstants.imgHeight = 80.0
            SpaceXApiConstants.imgWidth = 80.0
        }
    }
}
