//
//  Hero.swift
//  dot-a
//
//  Created by yxgg on 05/06/22.
//

import Foundation
import RealmSwift

class Heroes: Object {
  @Persisted var img: Data?
  @Persisted var localizedName: String = ""
  @Persisted var attackType: String = ""
  @Persisted var primaryAttr: String = ""
  @Persisted var baseHealth: Int = 0
  @Persisted var baseAttackMax: Int = 0
  @Persisted var moveSpeed: Int = 0
  @Persisted var roles = List<String>()
  @Persisted var baseMana: Int = 0
}
