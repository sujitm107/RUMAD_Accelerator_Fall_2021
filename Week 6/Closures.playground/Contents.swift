import UIKit

var names: [String] = ["Sam", "Alyssa", "John", "Penelope", "John"]

names = names.sorted(by: { (s1: String, s2:String) -> Bool in
    return s1 < s2
})

func usesClosure(incrementer: (Int) -> Int) -> Int {
    
    return incrementer(7)
}

var val = usesClosure(incrementer: {x in x + 5})

print(val)
