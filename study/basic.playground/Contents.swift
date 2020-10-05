import UIKit

var str = "Hello, playground"

var name = "abc", age = 20, email = "abc@gmail.com"

var x = 1
x = 2

print("name: \(name)")
print(x)

// Tao alias bien khac
typealias BigNumber = Double
let numberOfCoin:BigNumber = 1_000_000

// Optional
let numOfOptional:Int?
numOfOptional = nil

// Assert unit test
var ageNumber = 10;
// var ageNumber = -10
assert(ageNumber >= 0, "Age phai lon hon hoac bang 0")
precondition(ageNumber >= 0, "Age phai lon hon hoac bang 0")

// Tuples
let (widht, height) = (800, 600)

// Comparision
let isHD = (widht, height) > (1280, 720) ? "is HD" : "Not HD"

let ageNil:Int? = nil
let myAge = ageNil ?? 18 // If ageNil la empty thi set default la 18

// Loop

for index in 1...5 {
    print("Index is: \(index)")
}

let range = ...7
range.contains(8)

let animals = ["Dai","Tai","Bang","Nhut"]
for animal in animals[0...] {
    print("It is: \(animal)")
}

// Function and Closure

func gettingName(name: String, age: Int) -> String {
    return "My name is \(name) and i am \(age) year old!"
}

var andrePerson = gettingName(name: "andre", age: 32)
print(andrePerson)
var nelSonPerson = gettingName(name: "Nelson", age: 34)
print(nelSonPerson)


// Func Calculate Array in tuple

func calculateMaxMinSum (🍄: [Int]) -> (🐢: Int, 🦄: Int, 🐽: Int) {
    var 🦄 = 🍄[0]
    var 🐢 = 🍄[0]
    var 🐽 = 0
    for 🌻 in 🍄 {
        if (🌻 > 🦄) {
            🦄 = 🌻
        } else if (🌻 < 🐢) {
            🐢 = 🌻
        }
        🐽 += 🌻
    }
    return (🐢,🦄,🐽)
}

var cal1 = calculateMaxMinSum(🍄: [5,4,1,100,23])

print(cal1.🦄)
print(cal1.🐢)
print(cal1.🐽)

var 🐤 = "con ga"
print(🐤)


// Func nested
func getFullName() -> Int {
    var count = 1
    func convertName() {
        count += 1
    }
    convertName()
    return count
}

getFullName()


// Func return func
func makeIncrement() ->((Int) -> Int) {
    func addOne(num: Int) -> Int {
        return 1 + num
    }
    return addOne
}

var testIncre = makeIncrement();
testIncre(7)

// Func as paramter

func checkWithCondiction(list: [Int], condiction: (Int) -> Bool) -> Bool {
    for item in list {
        if condiction(item) {
            print(item)
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func getterThanTen(number: Int) -> Bool {
    return number > 10
}

var numbers = [1,2,3,11,12,13];

var isLess = checkWithCondiction(list: numbers, condiction: lessThanTen)
var isGetter = checkWithCondiction(list: numbers, condiction: getterThanTen)


// Closure
var mapInt = numbers.map({ (num: Int) -> Int in
    let result = num * 3
    return result
})

// Dictionary
var dictionaryList:[String:String] = ["name":"andre", "email":"andre@gmail.com"]
var dictionaryList2:[Int:String] = [1:"one", 2:"two", 3:"three"]

dictionaryList["name"]
dictionaryList2[2]
let oldEmail = dictionaryList2.updateValue("so ba", forKey: 3)
dictionaryList2[3]


// Struct

struct Shape {
    var width:Float = 0.0
    var height = 0.0
}

var aShape = Shape(width: 1.1, height: 2.2)
print("aShap has w:\(aShape.width) - h:\(aShape.height)")
var bShape = aShape
bShape.height = 2.3
print("bShap has w:\(bShape.width) - h:\(bShape.height)")


// Class
class User {
    var name = ""
    var email:String?
}

var aUser = User()
var bUser = aUser
var cUser = User()
if (aUser === bUser) {
    print("aUser và bUser cùng trỏ về 1 vùng nhớ")
}

if (cUser === aUser) {
    print("cUser và aUser cùng trỏ về 1 vùng nhớ")
} else {
    print("cUser và aUser khác vùng nhớ")
}


// Properites
struct EX {
    lazy var initWhenCall:String = {
        print("it will be run when be called")
        return "called";
    }()
    
    var x:Int
    var x2Cost:Int {
        get {
            print("it is GET")
            return x * 2
        }
        set {
            print("it is SET with NewValue: \(newValue)")
            x = newValue / 2
        }
    }
    
    var demoStep:Int = 0 {
        willSet(newStep) {
            print("it is newStep value: \(newStep)")
        }
        didSet {
            print("it is oldValue value: \(oldValue)")
        }
    }
    
    // Static
    static var staticVar1: String = "I am Static"
    
}

var ex1 = EX(x: 10)
ex1.initWhenCall
print(ex1.x2Cost)
ex1.x2Cost = 8
print(ex1.x)
ex1.demoStep = 1
EX.staticVar1


// Enum Sefl valeu

enum Comppass {
    case dong, tay, nam, bac
    mutating func moveToNext() {
        switch self {
        case .dong:
            self = .tay
        case .tay:
            self = .nam
        case .nam:
            self = .bac
        case .bac:
            self = .dong
        }
    }
}
 
var compass1 = Comppass.dong
compass1.moveToNext()
compass1.moveToNext()
compass1.moveToNext()
compass1.moveToNext()

// static methods and staic property
class VX {
    static let pi:Float = 3.14
    
    class func cricleArea(radius: Float) -> Float {
        return pi * radius * radius
    }
}

var cicleArea1:Float = VX.cricleArea(radius: 1.5)


// Subscript

struct OV {
    var initNum:Int = 2
    subscript(num: Int) -> Int {
        set {
            print(newValue)
            
        }
        get {
            return initNum * num
        }
    }
}

var ov1 = OV()
ov1[1]
ov1[5]
ov1[0] = 10

// Class init

class ET {
    var name: String
    init(newName: String) {
        name = newName
        print("Init Claass ET")
    }
}


var et1 = ET(newName: "Andre")
et1.name;


// Class override method
class parentEX {
    var name:String = "Parent"
    
    func printName() {
        print("parent Method")
    }
    func printAge() {
        print("parent Age Method")
    }
    
    var phone:String {
        return "013123123123"
    }
}

class chilEx: parentEX {
    override func printName() {
        print("child overrding Method")
    }
    
    var childName: String {
        return "Child from \(super.name)"
    }
    
    override var phone: String {
        return "child phone: \(super.phone)"
    }
    
    init(text: String) {
        
    }
    
    convenience override init() {
        self.init(text: "abc")
        
    }
}

var child1 = chilEx(text:"check convinence init" )
child1.printName()
child1.printAge()
child1.self.name
child1.childName
child1.phone


// deinit

class GamePlay {
    var score:Int = 0
    init(point: Int = 0) {
        score += point
    }
    deinit {
        score = 0
        print("Destroy Called")
    }
}

var gamer1: GamePlay? = GamePlay(point: 10)
gamer1!.score
gamer1 = nil

// Ep kieu => Down Casting vs Type Casting
var thing = [Any]() // may be array or object
thing.append(10)
thing.append(99.9)
thing.append("Type Casting")
thing.append((1.0, 2.0)) // type tuple
thing.append(child1)
thing.append({(name: String) -> String in "Hello \(name)"})

for item in thing {
    switch item {
    case let anInt as Int:
        print("It is An Int \(anInt)")
    case let anDouble as Double where anDouble > 0:
        print("It is An Double \(anDouble) and Positive")
    case let anString as String:
        print("It is An String \(anString)")
    case let (x,y) as (Double, Double):
        print("It is An Tuple dxd \((x,y))")
    case let stringClosure as (String) -> String:
        print("It is An Closure \(stringClosure("closure String ne"))")
    default:
        print("something else")
    }
}


// Extension
extension Double {
    var meter: Double {
        return self
    }
    var kilometer: Double {
        return self*1000
    }
    var centimet: Double {
        return self / 100
    }
}

let aViTri = 1.5.kilometer + 20.0.meter - 500.0.centimet

protocol Detail {
    var nickName: String { get }
    
    func showNickName() -> String
}


struct hinhVuong: Detail {
    var nickName: String {
        return "Nick name is here"
    }
    
    func showNickName() -> String {
        return "ke thua protocal"
    }
    
    var height, width: Int
}

extension hinhVuong {
    func dientich() -> Int {
        return self.height * self.width
    }
}

var hv1 = hinhVuong(height: 10, width: 5)
var dthv1 = hv1.dientich()
hv1.showNickName()
