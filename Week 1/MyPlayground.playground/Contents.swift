import UIKit

var str: String = "Hello, playground"

print(str);


var name = "Craig Federighi"

print("My name is \(name)")


var four: Int = 4
var three: Int = 3

enum Operator{
    case Add
    case Subtract
    case Divide
    case Multiply
    
}

var op: Operator = .Add


func evaluate(firstNum: Int, secondNum: Int, _ op: Operator) -> Int{
    
    switch op{
    case .Add:
        return firstNum + secondNum
    case .Subtract:
        return firstNum - secondNum
    case .Divide:
        return firstNum / secondNum
    case .Multiply:
        return firstNum * secondNum
    }
    
    
}

print(evaluate(firstNum: three, secondNum: four, op))


//Loops

for i in 0..<4{
    print(i)
}

class Human{
    var name: String
    var age: Int
    var homeTown: String
    
    //public Human(String name, int age, String homeTown)
    
    init(name: String, age: Int, homeTown: String) {
        self.name = name
        self.age = age
        self.homeTown = homeTown
    }
    
    func toString() -> String{
        
        return "Name: \(self.name), Age: \(self.age), HomeTown: \(self.homeTown)"
        
    }
    
}

var craig = Human(name: "Craig Federighi", age: 45, homeTown: "Cupertino, CA")

print(craig.name)

var appleExecs: [Human] = []

var appleExecsNames: [String] = ["Tim Cook", "Jeff Williams", "Jony Ive"]
var appleExecsAges: [Int] = [56, 54, 45, 50]
var homeTowns: [String] = ["Cupertino, CA", "Cupertino, CA", "Cupertino, CA", "Cupertino, CA"]

appleExecs.append(craig)

for i in 0..<appleExecsNames.count{
    
    appleExecs.append(Human(name: appleExecsNames[i], age: appleExecsAges[i], homeTown: homeTowns[i]))
    
    
}


for exec in appleExecs {
    
    print(exec.toString())
    
}

//struct vs class

struct Person{
    var name: String
    var age: Int
    var homeTown: String
}










