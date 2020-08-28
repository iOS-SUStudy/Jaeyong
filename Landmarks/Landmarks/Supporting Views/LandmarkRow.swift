//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 이재용 on 2020/08/28.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading) {
                Text(landmark.name).font(.headline)
                Text(landmark.state).font(.subheadline)
            }
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
