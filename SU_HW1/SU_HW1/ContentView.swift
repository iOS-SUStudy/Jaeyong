//
//  ContentView.swift
//  SU_HW1
//
//  Created by 이재용 on 2020/08/27.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
            CircleImage()
                .offset(y: -350)
                .padding(.bottom, -300)
            VStack(alignment: .center) {
                VStack {
                    Text("개용이's House")
                        .font(.title).foregroundColor(.black)
                        .padding()
                    Text("Hello, everyone")
                        .font(.subheadline)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
