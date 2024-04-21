//
//  Category.swift
//  SUPractice
//
//  Created by 남현정 on 2024/04/22.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}
struct CategoryView: View {
    @State private var query = ""
    @State private var category: [Category] = []
    
    let item = ["SF", "가족", "스릴러"]
    var filterCategory: [Category] {
        return query.isEmpty ? category : category.filter { $0.name.contains(query) }
    }
    var body: some View {
    
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { value in
                    NavigationLink {
                        SearchDetailView(category: value)
                    } label: {
                        setupRows(value)
                    }
                }
                
            }
            .navigationTitle("영화 검색")
            .searchable(text: $query, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요")
            .onSubmit(of: .search) {
                print("asdf") // searchbar에서 return누르면 print찍힘
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: {
                        category.append(Category(name: item.randomElement()!, count: Int.random(in: 1...100)))
                    }, label: {
                        Text("추가")
                    })
                }
            })
                
            
        }
    }
    func setupRows(_ category: Category) -> some View {
        HStack {
            Image(systemName: "person")
            Text("\(category.name), \(category.count)")
        }
    }
}

#Preview {
    CategoryView()
}


struct SearchDetailView: View {
    var category: Category // 값을 전달받기 위해서
    var body: some View {
        Text("\(category.name): \(category.count) 디테일 화면")
    }
}
