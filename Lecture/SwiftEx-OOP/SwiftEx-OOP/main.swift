//
//  main.swift
//  SwiftEx-OOP
//
//  Created by 김도연 on 2/6/25.
//

import Foundation

//MARK: - Cars
//let sonata = Car(color: "검정", speed: 110)
//let grandeur = Car(color: "하얀색", speed: 140)
//
//let cars = [sonata, grandeur]
//
//for car in cars {
//    car.drive()
//}

//MARK: - Shape
//var shapeArr = [Shape]()
//shapeArr.append(Circle(shapeName: "원"))
//shapeArr.append(Rectangle(shapeName: "사각형"))
//
//for shape in shapeArr {
//    shape.draw()
//}

ShapeView().main()

struct Tracking {
    // 사용할 때 불필요하게 인스턴스화 하지 않도록 하기 위함.
    private init() { }

    struct Screen {
        private init() { }

        static let splash = "A1_스플래시"
        static let onboarding = "A2_온보딩"
        static let applelogin = "A3_로그인 타입 선택"
        static let login = "A4_로그인 타입 선택"
        
        //MARK: - Settings
        static let settingMainVC = "S1_세팅 메인"
        static let accountInfoVC = "S2_계정 정보"
        static let profileEditVC = "S3_프로필 수정"
        
        static let wishListVC = "S4_위시리스트 목록"
        
        static let myWineVC = "S5_보유와인 목록"
        static let myWineDetailVC = "S6_보유와인 상세"
        static let createMyWineVC = "S7_보유와인 생성"
        static let updateMyWineVC = "S8_보유와인 수정"
        static let setMyWineDateVC = "S9_보유와인 날짜 선택"
        static let setMyWinePriceVC = "S10_보유와인 가격 입력"
        
        static let noticeVC = "S11_공지사항 목록"
        static let appInfoVC = "S12_앱 정보"
        static let inquiryVC = "S13_문의하기"
        
    }

    struct Event {
        private init() { }

        static let touchOnboardingStart = "A2_온보딩_시작"
        static let touchKakaoLogin = "A3_로그인_카카오"
        static let touchAppleLogin = "A3_로그인_애플"
    }
}
