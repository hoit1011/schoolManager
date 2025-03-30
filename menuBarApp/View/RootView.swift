//
//  RootView.swift
//  menuBarApp
//
//  Created by 박성민 on 3/30/25.
//

import SwiftUI

struct RootView: View {
    @State private var selectItem: MenuItem = .main
    var body: some View {
        HStack{
            VStack{
                switch selectItem {
                case .main:
                    MainView()
                case .homework:
                    HomeWorkView()
                case .mypage:
                    MyPageView()
                }
            }
            Spacer()
            VStack(spacing: 16) {
                Button {
                    selectItem = .main
                } label: {
                    Label("메인페이지", systemImage: "house.fill")
                        .labelStyle(.titleAndIcon)
                        .frame(minWidth: 100)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.blue)
                
                Button {
                    selectItem = .homework
                } label: {
                    Label("숙제", systemImage: "books.vertical.fill")
                        .labelStyle(.titleAndIcon)
                        .frame(minWidth: 100)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.green)
                
                Button {
                    selectItem = .mypage
                } label: {
                    Label("마이페이지", systemImage: "person.crop.circle.fill")
                        .labelStyle(.titleAndIcon)
                        .frame(minWidth: 100)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(.orange)
            }
            .padding()
        }
        .frame(width: 400, height: 200)
        .padding()
    }
}

#Preview {
    RootView()
}
