//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 이재용 on 2020/09/23.
//  Copyright © 2020 jaeyong. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        /// 이렇게 NavigationLink를 달아주면 CategoryItem은 자동으로 버튼이 된다.
                        /// 이렇게 되고 Home으로 들어가서 Preview모드로 보면 Label이 링크가 달려 파랑색으로 바뀐걸 볼수 있다.
                        NavigationLink(
                            destination: LandmarkDetail(
                                landmark: landmark
                            )
                        ) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            // 이미지 지정
            landmark.image
                .renderingMode(.original) /// A setting that determines how the app renders an image.
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            // 이름 지정
            Text(landmark.name)
                .foregroundColor(.primary) /// 색깔도 원래대로
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryRow(
                // 임의의 값 집어넣기
                // 어차피 CategoryHome 에서 데이터를 전달해주기 때문에 뷰가 잘 뜨는지 확인용
                categoryName: landmarkData[0].category.rawValue,
                items: Array(landmarkData.prefix(4))
            )
            .environmentObject(UserData())
        }
    }
}
