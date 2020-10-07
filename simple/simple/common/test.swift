//
//  test.swift
//  simple
//
//  Created by andre on 10/7/20.
//

import UIKit

class checkFunc {
    func checkAsync() {
        let queue = DispatchQueue(label: "queue_action_1")
        queue.async {
            for i in 1...5 {
                print("i=" + String(i))
            }
        }
    }
}



