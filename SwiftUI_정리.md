# SwiftUI Tutorials



## SwiftUI Essentials

### Creating and Combining Views

- Text View를 커스텀하는 방법

  Preview에서 Text를 command-click 한 후, Inspect를 누릅니다. 여러 속성들이 있고 그 안에서 커스텀이 가능합니다. 또한 Aspect Inspector에서도 속성 변경할 수 있으며 아래와 같은 코드로 변경이 가능합니다.

  ```swift
  Text("Turtle Rock").font(.title) // font Size 변경
  									 .foregroundColor(.green) // text color 변경
  ```

- Stack View

  ```swift
   VStack(alignment: .leading, spacing: 1.0) { // Vertical Stack
   			Text("Turtle Rock").font(.title)
        HStack { // Horizontal Stack
             Text("Joshua Tree National Park").font(.subheadline)
          	 Spacer()
             Text("California").font(.subheadline)
  			}
  }.padding()
  ```

  > Spacer() : 해당 뷰의 너비나 높이를 지정해주지 않아도 부모 뷰의 공간을 모두 사용할 수 있도록 만들어준다.
  >
  > padding() : 해당 뷰의 위아래양옆에 공간을 준다.

- Image View 

  ```swift
  Image("turtlerock")
        .clipShape(Circle()) // Circle()로 이미지를 감쌉니다! 즉 틀을 만들어 이미지 위에 올려놓는다는 의미
        .overlay(Circle().stroke(Color.gray, lineWidth: 4)) // 이것도 위에 올려놓는다
       	.shadow(radius: 10) // 그림자 주기
  ```

- MapKit 사용해보기

  **UIViewRepresentable** Protocol : 두가지 함수를 가져야 한다. MKMapView를 만드는 함수, 뷰를 구성하고 변화에 반응하는 함수

  ```swift
  import MapKit
  
  struct MapView: UIViewRepresentable {
      func makeUIView(context: Context) -> MKMapView {
          MKMapView(frame: .zero)
      }
  
      func updateUIView(_ uiView: MKMapView, context: Context) {
          let coordinate = CLLocationCoordinate2D(
              latitude: 34.011286, longitude: -116.166868) // 좌표
          let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0) // 확대/축소
          let region = MKCoordinateRegion(center: coordinate, span: span) 
          uiView.setRegion(region, animated: true)
  		}
  }
  ```

  ❗️preview는 정적이기 때문에 live preview 버튼을 눌러 live모드로 바꾸어주어야한다.

- View 합치기

  ```swift
  struct ContentView: View {
      var body: some View {
          VStack {
              MapView()
                  .edgesIgnoringSafeArea(.top) // sareArea까지 덮기 (to SuperView)
                  .frame(height: 300)
              CircleImage()
                  .offset(y: -130)
                  .padding(.bottom, -130) // 아래 VStack을 끌어올리기 위해. 130 아래에 위치시킴
              VStack(alignment: .leading, spacing: 1.0) {
                  Text("Turtle Rock!").font(.title)
                  HStack {
                      Text("Joshua Tree National Park").font(.subheadline)
                      Spacer()
                      Text("California").font(.subheadline)
                  }
              }.padding()
              Spacer()
          }
      }
  }
  ```




### Building Lists and Navigation

성은쌤 왈: SwiftUI의 List는 Storyboard의 TableView와 비슷하다.

- Row View 

  ```swift
  struct LandmarkRow: View {
      var landmark: Landmark // Landmark 타입 하나 생성한다.
      
      var body: some View {
          HStack {
              landmark.image
            				.resizable() // 이미지 사이즈 조절하기 전에 원하는대로 써주어야 조정된다.
            				.frame(width: 50, height: 50, alignment: .center) // 이미지 사이즈 조절
              Text(landmark.name)
              Spacer()
          }
      }
  }
  
  struct LandmarkRow_Previews: PreviewProvider {
      static var previews: some View {
          LandmarkRow(landmark: landmarkData[0]) // LandmarkRow struct에 변수 넣어주어야 한다.
    							       									 // landmarkData는 .json파일을 읽어 생성한 전역 변수이다.
      }
  }
  ```

- Row Preview 커스텀하기

  ```swift
  Group {
        LandmarkRow(landmark: landmarkData[0]) 
        LandmarkRow(landmark: landmarkData[1])
  }.previewLayout(.fixed(width: 300, height: 70)) // list내 row의 사이즈를 결정
  ```

  > Group은 여러개의 view들을 담는 container이다. 분리된 상태로 preview에 나타내준다.
  >
  > <img width="50%" src="https://user-images.githubusercontent.com/56102421/91539972-1c080100-e955-11ea-938b-468e3d65d121.png"> 

- List 만들기

  ```swift
  struct LandmarkList: View {
      var body: some View {
          List(landmarkData, id: \.id) { landmark in
              LandmarkRow(landmark: landmark)
          }
      }
  }
  ```

  > List는 *identifiable* data를 이용하여 만든다. Data를 *identifiable*하게 만드는 두가지 방법이 있다. 하나는 property에 id를 하나씩 넘기는 방법이 있고, 다른 하나는 Identifiable protocol을 Data type에 부여하는 것이다.

- Navigation 연결하여 List Detail로 넘어가기

  ```swift
  NavigationView { // NavigationView 로 묶어주기
       List(landmarkData) { landmark in
            NavigationLink(destination: LandmarkDetail()) { // 누르면 넘어가는 목적지 View
                 LandmarkRow(landmark: landmark)
       		  }
       }
       .navigationBarTitle(Text("Landmarks"))
  }
  ```

- 연결된 Navigation에서 데이터 다음 페이지로 넘겨주기

  struct에서 변수 생성 후 변수로 데이터를 넘겨준다. 아래는 그 예시

  CricleImage.swfit 파일

  ```swift
  
  struct CircleImage: View {
      var image: Image
      var body: some View {
          image
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.gray, lineWidth: 4))
              .shadow(radius: 10)
      }
  }
  ```

  LandmarkDetail.swift 파일

  ```swift
  CircleImage(image: landmark.image)
                  .offset(y: -130)
  ```

- Preview 다양하게 보기

  ```swift
  static var previews: some View {
          ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
              LandmarkList()
                  .previewDevice(PreviewDevice(rawValue: deviceName))
          }
  }
  ```




### Handling User Input

- State & ObservableObject & EnvironmentObject 

