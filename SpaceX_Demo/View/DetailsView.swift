//
//  DetailsView.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 29/01/21.
//

import SwiftUI

struct DetailsView: View {
    let rocket:RocketModel
    var body: some View {
        
        VStack(alignment: HorizontalAlignment.center){
            
            HStack{
                Text(rocket.name?.uppercased() ?? "")
                    .font(.title)
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
            RemoteImage(url: rocket.flickr_images?[0] ?? "")
            List{
                
                HStack{
                    Text("Company :- ")
                        .font(.headline)
                    Text(rocket.company ?? "")
                        .font(.subheadline)
                }
                HStack{
                    Text("Status :- ")
                        .font(.headline)
                    if rocket.active ?? false{
                        Text("Active")
                    }else{
                        Text("InActive")
                    }
                }
                HStack{
                    Text("Country :- ")
                        .font(.headline)
                    Text(rocket.country ?? "")
                        .font(.subheadline)
                }
                HStack(alignment: VerticalAlignment.firstTextBaseline){
                    Text("Description :- ")
                        .font(.headline)
                    Text(rocket.description ?? "")
                        .font(.subheadline)
                }
                HStack{
                    Text("First_flight :- ")
                        .font(.headline)
                    Text(rocket.first_flight ?? "")
                        .font(.subheadline)
                }
                HStack{
                    Text("Cost_per_launch :- ")
                        .font(.headline)
                    Text("$ \(rocket.cost_per_launch!)")
                        .font(.subheadline)
                }
                Link("Wikipedia",
                     destination: URL(string: rocket.wikipedia ?? "")!)
                    .foregroundColor(.blue)
                
            }
        }.onAppear(){
            SpaceXApiConstants.imgHeight = 200.0
            SpaceXApiConstants.imgWidth = 300
        }
    }
}

