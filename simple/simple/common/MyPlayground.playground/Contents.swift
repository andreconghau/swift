import UIKit

// DEMO về bất đồng bộ khi dùng GCD


//let queue = DispatchQueue(label: "queue_action_1")
//queue.async {
//    for i in 1...5 {
//        print("async=" + String(i))
//    }
//}
//for i in 1...5 {
//    print("sync=" + String(i))
//}


print("=========================")

// DEMO về bất đồng bộ với GROUP limit timer khi dùng GCD

let queue2 = DispatchQueue(label: "queue_action_2")
let queue_group = DispatchGroup()
queue_group.enter()
queue2.async {
    for i in 0...5 {
        print("in group =" + String(i))
        sleep(1)
    }
    queue_group.leave()
}
// Kiểm tra status sau 2s xe đã xử lý xong group phía trên hay chưa
let queue_status = queue_group.wait(timeout: DispatchTime.now() + 1)
print(queue_status)
for i in 1...5 {
    print("out group =" + String(i))
}
