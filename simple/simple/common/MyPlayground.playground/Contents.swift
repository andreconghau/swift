import UIKit

var str = "Hello, playground"


let queue = DispatchQueue(label: "queue_action_1")
queue.async {
    for i in 1...5 {
        print("async=" + String(i))
    }
}
for i in 1...5 {
    print("sync=" + String(i))
}
