**1주차 과제: 원하는 위치 입력해서 지도에 나타내기**

<img src="https://user-images.githubusercontent.com/56102421/91545989-c172a300-e95c-11ea-944b-14dcf7c2770f.png" width="30%">  

**2주차 과제: row에 국가 정보 추가, Separator 없애기, 카테고리 정보 추가**

<img src="https://user-images.githubusercontent.com/56102421/91546603-afddcb00-e95d-11ea-93b6-80c45fd7c019.png" width="30%">  <img width="30%" src="https://user-images.githubusercontent.com/56102421/91546156-fa127c80-e95c-11ea-91b3-f950266b41a2.png"> 

- List에서 Seperator 없애기

  LandmarkList.swift 내의 LandmarkList Struct에 추가

```swift
init() {
        //UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .clear
}
```



**3주차 과제: isFeatured 값 추가하기**

<img src="https://user-images.githubusercontent.com/56102421/92227453-4459a780-eee1-11ea-8fc5-7b0c7ad647e5.png" width="30%"> 