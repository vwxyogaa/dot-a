//
//  Dota.swift
//  dot-a
//
//  Created by yxgg on 05/06/22.
//

import Foundation
import RealmSwift

class Hero: Object {
  @Persisted var img: Data?
  @Persisted var localizedName: String = ""
  @Persisted var attackType: String = ""
  @Persisted var primaryAttr: String = ""
  @Persisted var baseHealth: String = ""
  @Persisted var baseAttackMax: String = ""
  @Persisted var moveSpeed: String = ""
  @Persisted var roles = List<String>()
}
