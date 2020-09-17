//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by 이재용 on 2020/09/10.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-100)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 0))
    }
}
