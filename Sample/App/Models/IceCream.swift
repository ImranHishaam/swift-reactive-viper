//
//  Icecream
//  Sample
//
//  Created by imranhishaam on 3/12/18.
//  Copyright © 2018 imranhishaam. All rights reserved.
//

import Foundation

//MARK: - Equatable Protocol implementation

func ==(lhs: Icecream, rhs: Icecream) -> Bool {
  return (lhs.name == rhs.name
    && lhs.priceInDollars == rhs.priceInDollars
    && lhs.countryFlagEmoji == rhs.countryFlagEmoji)
}

//MARK: - Mmmm...chocolate...

struct Icecream: Equatable {
  let priceInDollars: Float
  let name: String
  let countryFlagEmoji: String
  
  // An array of chocolate from europe
  static let ofEurope: [Icecream] = {
    let belgian = Icecream(priceInDollars: 8,
                            name: "Belgium",
                            countryFlagEmoji: "🇧🇪")
    let british = Icecream(priceInDollars: 7,
                            name: "Great Britain",
                            countryFlagEmoji: "🇬🇧")
    let dutch = Icecream(priceInDollars: 8,
                          name: "The Netherlands",
                          countryFlagEmoji: "🇳🇱")
    let german = Icecream(priceInDollars: 7,
                           name: "Germany", countryFlagEmoji: "🇩🇪")
    let swiss = Icecream(priceInDollars: 10,
                          name: "Switzerland",
                          countryFlagEmoji: "🇨🇭")
    
    
    return [
      belgian,
      british,
      dutch,
      german,
      swiss,
    ]
  }()
}

extension Icecream: Hashable {
  var hashValue: Int {
    return self.countryFlagEmoji.hashValue
  }
}
