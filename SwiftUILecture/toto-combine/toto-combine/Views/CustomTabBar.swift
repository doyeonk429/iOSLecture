//
//  CustomTabBar.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    let icons: [(Tab, String)] = [
        (.home, "square.grid.3x3.fill"),
        (.profile, "person.crop.circle.fill")
    ]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(icons, id: \.0) { tab, icon in
                GeometryReader { geometry in
                    let isSelected = selectedTab == tab
                    ZStack {
                        if isSelected {
                            // 반원 배경
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                                .offset(y: -20)
                                .shadow(radius: 4)
                        }

                        Button(action: {
                            withAnimation(.spring()) {
                                selectedTab = tab
                            }
                        }) {
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(isSelected ? .blue : .gray)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .offset(y: isSelected ? -20 : 0)
                    }
                }
                .frame(height: 60)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom, 10)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 5)
        )
    }
}
