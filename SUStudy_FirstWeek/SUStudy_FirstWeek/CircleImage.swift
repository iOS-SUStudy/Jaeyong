//
//  CircleImage.swift
//  SUStudy_FirstWeek
//
//  Created by 이재용 on 2020/08/27.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
