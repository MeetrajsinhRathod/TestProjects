import Foundation

//-------------------------------------------------Functions-------------------------------------------------

//Implement the following functions. The divides function returns true if a is divisible by b and false otherwise. The countDivisors function should use the divides function to return the number of divisors of number. TheisPrime function should use the countDivisors function to determine if number is prime.

func divides(dividend: Int, divisor: Int) -> Bool {
    return dividend % divisor == 0
}

divides(dividend: 4, divisor: 2)

func countDivisors(number: Int) -> Int {
    var divisorCount = 0
    //loop to count the number of divisors
    for val in 1...number {
        if divides(dividend: number, divisor: val) {
            divisorCount += 1
        }
    }
    return divisorCount
}

countDivisors(number: 5)

func isPrime(number: Int) -> Bool {
    return countDivisors(number: number) == 2
}

isPrime(number: 2)

//Write a function named countdown that takes a number N. The function should print the numbers from N to 1 with a one second pause in between and then write GO! in the end. To make the computer wait for one second call thesleep function from the standard library. The sleep function takes one parameter, the number of seconds to sleep.

func countDown(countFrom: Int) {
    var count = countFrom
    //loop for count down from N to 1
    repeat {
        print(count)
        sleep(1)
        count -= 1
    } while (count > 0)

    print("GO!")
}

countDown(countFrom: 5)

//A queue is a data structure that can perform two operations:
//• push which takes a value and adds it at the end of the queue
//• pop which returns the value from the start of the queue and removes it from the queue
//Your task is to implement the push and pop operations. The most simple way to represent a queue is using an array. Here are some example operations.
//// here we define an empty queue
//var queue: [Int] = []
//
//// add 1 in the queue
//push(1, &queue) // queue = [1]
//
//// add 2 in the queue
//push(2, &queue) // queue = [1, 2]
//
//// pop the first element
//pop(&queue) // 1, queue = [2, 3]
//
//// add 3 in the queue
//push(3, &queue) // queue = [2, 3]
//
//// pop the first element
//pop(&queue) // 2, queue = [3]
//
//// pop the first element
//pop(&queue) // 3, queue = []
//
//// pop the first element
//pop(&queue) // returns nil because there are no elements in the queue
//// queue = []
//The push function should take two parameters, the number and the queue as an inout parameter.
//Push Function Definition
//The pop function should take queue as an inout parameter and return the first number from the queue after removing it. If the queue is empty it should return nil – the result type should be an optional integer(Int?).
//Pop Function Definition

// using structure
struct Queue<T> {
    
    private var element = [T]()

    func isEmpty() -> Bool {
        return element.isEmpty
    }

    mutating func push(pushElement: T) {
        element.append(pushElement)
    }

    mutating func pop() -> T? {
        //check if queue is empty or not before removing an element
        if isEmpty() {
            return nil
        }
        return element.removeFirst()
    }

    func printQueue() {
        print(element)
    }
}

var queue1 = Queue<Int>()

queue1.push(pushElement: 2)
queue1.push(pushElement: 1)
queue1.push(pushElement: 3)
queue1.printQueue()
queue1.pop()
queue1.pop()
queue1.printQueue()

//-------------------------------------------------Closures-------------------------------------------------

//Write a function named applyKTimes that takes an integer K and a closure and calls the closure K times. The closure will not take any parameters and will not have a return value.

func applyKTimes(Ktimes: Int, recurringClosure: () -> ()) {
    var repeatTill = Ktimes
    //loop to call closure K times
    repeat {
        recurringClosure
        repeatTill -= 1
    } while (repeatTill > 0)
}

applyKTimes(Ktimes: 3) {
    print("from closure")
}

//--------------------------------------------------------------------------------------------------
//protocol bank getSimple Interest
//1 base class sbi hdfc
//user input sbi , sbi interest function called

protocol Bank {
    
    var duration: Int { get }
    var principalAmount: Int { get }
    var rate: Int { get }

    func getSimpleInterest()
}

class Sbi: Bank {

    let duration: Int
    let principalAmount: Int
    let rate: Int

    init(duration_inyear: Int, principalAmount: Int, rate_percent: Int) {
        self.duration = duration_inyear
        self.principalAmount = principalAmount
        self.rate = rate_percent
    }

    func getSimpleInterest() {
        print("\((principalAmount * rate * duration) / 100)")
    }
}

class Hdfc: Bank {

    let duration: Int
    let principalAmount: Int
    let rate: Int

    init(duration_inyear: Int, principalAmount: Int, rate_percent: Int) {
        self.duration = duration_inyear
        self.principalAmount = principalAmount
        self.rate = rate_percent
    }

    func getSimpleInterest() {
        print("\((principalAmount * rate * duration) / 100)")
    }
}

let sbiUser = Sbi(duration_inyear: 1, principalAmount: 3000, rate_percent: 8)
sbiUser.getSimpleInterest()

let hdfcUser = Hdfc(duration_inyear: 1, principalAmount: 3000, rate_percent: 10)
hdfcUser.getSimpleInterest()