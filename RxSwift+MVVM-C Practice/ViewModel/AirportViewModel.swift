//
//  AirportViewModel.swift
//  RxSwift+MVVM-C Practice
//
//  Created by yeonBlue on 2022/01/08.
//

import Foundation

protocol AirportViewPresentable {
    typealias Input = ()
    typealias Output = ()
    
    var input: AirportViewPresentable.Input { get }
    var output: AirportViewPresentable.Output { get }
}

struct AirportViewModel: AirportViewPresentable {
    
    var input: AirportViewPresentable.Input
    var output: AirportViewPresentable.Output
    

}
