//
//  DotaProvider.swift
//  dot-a
//
//  Created by yxgg on 04/06/22.
//

import Foundation
import Alamofire

private let baseUrl = "https://api.opendota.com/api/herostats"

class DotaProvider {
  static let shared: DotaProvider = DotaProvider()
  private init() { }
  
  func getListHero(completion: @escaping (Result<[HeroStats], Error>) -> Void) {
    AF.request(
      baseUrl,
      method: .get
    ).validate().responseDecodable(of: [HeroStats].self) { response in
      switch response.result {
      case .success(let value):
        completion(.success(value))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
