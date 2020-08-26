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
        Image("dog").resizable()
            .frame(width: 40, height: 40, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 2)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
