//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 이재용 on 2020/08/28.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI


struct LandmarkList: View {
    init() {
        // To remove only extra separators below the list:
//        UITableView.appearance().tableFooterView = UIView()
        // To remove all separators including the actual ones:
//        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .clear
    }
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
                
            }
            
            .navigationBarTitle(Text("Landmarks"))

        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
