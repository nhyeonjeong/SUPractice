//
//  RandomImageView.swift
//  SUPractice
//
//  Created by 남현정 on 2024/04/22.
//

import SwiftUI

struct SectionView: View {
    @Binding var title: String
    let url = URL(string: "https://picsum.photos/200/300")
    var image: some View {
        random()
    }
    var body: some View {
        Section(title) {
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<10) { _ in
                        NavigationLink {
                                
                            EditSectionView(image: image as? Image ?? Image(systemName: "star"), title: $title)
                            
                        } label: {
                            image
                        }
                    }
                }
                
            }
        }
    }
    func random() -> some View {
        AsyncImage(url: url) { data in // 예외처리에 대한 처리 중요!
            switch data { // 애플이 data 케이스를 확정을 안해줘서 미래버전에 대한 대응을 하라는 노란 오류가 뜬다.
            case .empty: // 아직 데이터가 안왔을 때
                // indicator쓰고 싶으면
                ProgressView()
                    .frame(width: 100, height: 150) // 여기도 크기를 지정해줘야 처음에 한 화면에 여러개의 사진이 뜨지 않는다(미리 크기를 지정해줘야..)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 150)
                    .clipShape(.rect(cornerRadius: 10), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                    
                
            case .failure(_):
                Image(systemName: "star")
                    .frame(width: 100, height: 150)
                
            @unknown default:
                Image(systemName: "star")
                    .frame(width: 100, height: 150)
            }
        }
    }
}
struct RandomImageView: View {
    @State private var firstSectionTitle = "첫 번째 섹션"
    @State private var secondSectionTitle = "두 번째 섹션"
    @State private var thirdSectionTitle = "세 번째 섹션"
//    private var sectionArray: [String] {
//        [firstSectionTitle, secondSectionTitle, thirdSectionTitle]
//    }

    var body: some View {
        NavigationView {
            List {
                SectionView(title: $firstSectionTitle)
                SectionView(title: $secondSectionTitle)
                SectionView(title: $thirdSectionTitle)
            }
            .navigationTitle("My Random Image")
            .listStyle(.plain)
        }
    }
}

#Preview {
    RandomImageView()
}
