//
//  RootDota.swift
//  dot-a
//
//  Created by yxgg on 04/06/22.
//

import Foundation

struct RootHero: Codable {
  let rootHeroStats: [HeroStats]
}

struct HeroStats: Codable {
  let id: Int
  let img: String
  let localizedName: String
  let attackType: String
  let primaryAttr: String
  let baseHealth: Int
  let baseAttackMax: Int
  let moveSpeed: Int
  let roles: [String]
  let baseMana: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case img
    case localizedName = "localized_name"
    case attackType = "attack_type"
    case primaryAttr = "primary_attr"
    case baseHealth = "base_health"
    case baseAttackMax = "base_attack_max"
    case moveSpeed = "move_speed"
    case roles
    case baseMana = "base_mana"
  }
}
