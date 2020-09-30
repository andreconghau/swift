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
    
}

var ex1 = EX(x: 10)
ex1.initWhenCall
print(ex1.x2Cost)
ex1.x2Cost = 8
print(ex1.x)
ex1.demoStep = 1
