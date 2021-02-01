//
//  RocketVM.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 30/01/21.
//

import SwiftUI
import Foundation
import Alamofire

class Rocket_VM : ObservableObject {
    
    @Published var arrRocket = [RocketModel]()
    @Published public var isLoaded: Bool = true
    
    func fetch_Rockets() {
        AF.request(SpaceXApiConstants.SpaceXURLs.APIBaseURL+"rockets").response { response in
            DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                self.isLoaded = false
            }
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([RocketModel].self, from: data)
                    DispatchQueue.main.async {
                        self.arrRocket = userResponse
                    }
                }catch let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
}
