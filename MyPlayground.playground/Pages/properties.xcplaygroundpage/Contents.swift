import Foundation
//--------------------------------------------------Properties--------------------------------------------------

// stored and computed properties
struct Circle {
    var radius: Double
    var center: (Int, Int)

    static var r: Double = 2.0

    var area: Double {
        get {
            return 3.14 * radius * radius
        }
        set {
            radius = newValue
        }
    }
}
var ball = Circle(radius: 10.0, center: (0, 0))
ball.area = 30.0
ball.radius
enum num {
    case caseOne
    case caseTwo
    static var staticNum = 10

    var numGet: String {
        switch self {
        case .caseOne: return "caseOne"
        case .caseTwo: return "caseTwo"
        }
    }
}
num.caseTwo.numGet

// property observer & type properties
class Samplepgm {
    class var msg: String {
        return "this is the msg"
    }
    var counter: Int = 0 {
        willSet {
            print("Total Counter is: \(newValue)")
        }
        didSet {
            if counter > oldValue {
                print("Newly Added Counter \(counter - oldValue)")
            }
        }
    }
}

let NewCounter = Samplepgm()
NewCounter.counter = 100
NewCounter.counter = 800
print(Samplepgm.msg)

// property wrapper
@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.uppercased() }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}
var user = User(firstName: "meetraj", lastName: "rathod")
print(user.firstName)
user.firstName = "hehehe"
print(user.firstName)

@propertyWrapper
struct Currency {
    var rupee: String = ""
    var wrappedValue: String {
        get {
            return rupee
        }
        set {
            rupee = "₹" + newValue
        }
    }
    init (wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

struct Bill {
    @Currency var amount: String
}

var electricityBill = Bill(amount: "10")
print(electricityBill.amount)

enum ColorCode {
    case rgb(red: Int, green: Int, blue: Int)
    mutating func doSomething() {
        self = .rgb(red: 20, green: 30, blue: 40)
    }
}
var rgbColor = ColorCode.rgb(red: 100, green: 0, blue: 0)
print("rgb color code is : \(rgbColor)")
rgbColor.doSomething()
print("rgb color code is : \(rgbColor)")


@propertyWrapper
struct Confidential {
    var val: String
    let password: String

    init(wrappedValue value: String, password: String) {
        self.val = value
        self.password = password
    }
    var wrappedValue: String {
        get {
            return val
        }
        set {
            if checkPassword() {
                val = newValue
            }
            else {
                print("wrong password")
            }
        }
    }
    func checkPassword() -> Bool {
        let enteredPassword = "password"
        return enteredPassword == password
    }
}

struct SecureData {
    @Confidential var secretValue: String
}

var data = SecureData(secretValue: Confidential(wrappedValue: "confidential", password: "password"))
data.secretValue = "new secret data"
print(data.secretValue)
