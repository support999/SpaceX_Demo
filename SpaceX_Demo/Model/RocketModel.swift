//
//  RocketModel.swift
//  SpaceX_Demo
//
//  Created by Amit Saxena on 29/01/21.
//

import Foundation

struct RocketModel : Codable, Identifiable {
    
    let id = UUID()
    
    let rocketid : Int?
    let id_main : String?
    let name : String?
    let type : String?
    let active : Bool?
    let stages : Int?
    let boosters : Int?
    let cost_per_launch : Int?
    let success_rate_pct : Int?
    let first_flight : String?
    let country : String?
    let company : String?
    let flickr_images : [String]?
    let wikipedia : String?
    let description : String?
    
    enum CodingKeys: String, CodingKey {
        
        case rocketid = "rocketid"
        case id_main = "id"
        case name = "name"
        case type = "type"
        case active = "active"
        case stages = "stages"
        case boosters = "boosters"
        case cost_per_launch = "cost_per_launch"
        case success_rate_pct = "success_rate_pct"
        case first_flight = "first_flight"
        case country = "country"
        case company = "company"
        case flickr_images = "flickr_images"
        case wikipedia = "wikipedia"
        case description = "description"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rocketid = try values.decodeIfPresent(Int.self, forKey: .rocketid)
        id_main = try values.decodeIfPresent(String.self, forKey: .id_main)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        stages = try values.decodeIfPresent(Int.self, forKey: .stages)
        boosters = try values.decodeIfPresent(Int.self, forKey: .boosters)
        cost_per_launch = try values.decodeIfPresent(Int.self, forKey: .cost_per_launch)
        success_rate_pct = try values.decodeIfPresent(Int.self, forKey: .success_rate_pct)
        first_flight = try values.decodeIfPresent(String.self, forKey: .first_flight)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        flickr_images = try values.decodeIfPresent([String].self, forKey: .flickr_images)
        wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        
    }
}
