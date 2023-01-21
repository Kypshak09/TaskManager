//
//  SwitchProcol.swift
//  Busy Man
//
//  Created by Amir Zhunussov on 18.01.2023.
//

import Foundation
protocol SwitchRepeatProtocol: AnyObject {
    func switchRepeat(value: Bool)
}

protocol PressButton: AnyObject {
    func readyButton(index: IndexPath)
}
