//
//  ContentView.swift
//  SUPractice
//
//  Created by 남현정 on 2024/04/16.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {

                VStack(alignment: .leading, content: {
                    HStack {
                        VStack(alignment: .leading) {
                            Image("firework")
                            
                            Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
                                .modifier(TitleModifier())
                            
                            VStack(alignment: .leading) {
                                recommendLine(image: "calendar", text: "매일 포인트 받는 출석체크, 퀴즈")
                                recommendLine(image: "newEvent", text: "새로운 이벤트")
                                recommendLine(image: "star", text: "미션 추천")
                            }
                            .font(.subheadline)
                        }
                        Spacer()
                    }
                })
                .frame(maxWidth: .infinity)
//                .border(.green)
                
                Spacer()
            
            Spacer()
            
            VStack {
                HStack {
                    Text("[선택] 맞춤형 서비스 이용 동의")
                    Spacer()
                }
                .padding(.bottom, 24)
                    
                BlueButton()
                
                Text("다음에 하기")
                
            }
            .frame(maxWidth: .infinity)

        }
        .padding(8)
        
    }
    
    func recommendLine(image: String, text: String) -> some View {
        HStack {
            Image(image)
            Text(text)
        }
    }
}

#Preview {
    ContentView()
}
