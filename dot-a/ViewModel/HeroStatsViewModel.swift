//
//  HeroStatsViewModel.swift
//  dot-a
//
//  Created by yxgg on 04/06/22.
//

import Foundation

struct HeroStatsViewModel {
  let heroStats: HeroStats
}

extension HeroStatsViewModel {
  init(_ heroStats: HeroStats) {
    self.heroStats = heroStats
  }
}

extension HeroStatsViewModel {
  var id: Int {
    return self.heroStats.id
  }
  
  var img: String {
    return self.heroStats.img
  }
  
  var localizedName: String {
    return self.heroStats.localizedName
  }
  
  var attackType: String {
    return self.heroStats.attackType
  }
  
  var primaryAttr: String {
    return self.heroStats.primaryAttr
  }
  
  var baseHealth: Int {
    return self.heroStats.baseHealth
  }
  
  var baseAttackMax: Int {
    return self.heroStats.baseAttackMax
  }
  
  var moveSpeed: Int {
    return self.heroStats.moveSpeed
  }
  
  var roles: [String] {
    return self.heroStats.roles
  }
}
