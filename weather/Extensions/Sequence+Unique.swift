//
//  Sequence+Unique.swift
//  weather
//
//  Created by Erdem ILDIZ on 15.08.2020.
//  Copyright © 2020 Erdem ILDIZ. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
