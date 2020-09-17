//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by 이재용 on 2020/09/10.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 239.0 / 255, green: 182.0 / 255, blue: 210.0 / 255)
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.05
                let middle = width / 2
                let topWidth = 0.3 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                // 동일한 Path { } 내에 여러 도형 넣을 때 간격 삽입
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
