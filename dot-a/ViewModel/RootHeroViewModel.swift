//
//  DotaViewModel.swift
//  dot-a
//
//  Created by yxgg on 04/06/22.
//

import Foundation

struct RootHeroViewModel {
  let rootHeroStats: [HeroStats]
}

extension RootHeroViewModel {
  var numberOfSections: Int {
    return 1
  }
  
  func numberOfRowsInSection(_ section: Int) -> Int {
    return self.rootHeroStats.count
  }
  
  func dotaHeroIndex(_ index: Int) -> HeroStatsViewModel {
    let dotaHero = self.rootHeroStats[index]
    return HeroStatsViewModel(dotaHero)
  }
}
