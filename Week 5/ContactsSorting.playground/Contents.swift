import UIKit

var names: [String] = ["Duncan", "Mark", "Mike", "John", "Penelope", "Donald", "Daffy", "Albert"]

/*
 
 D: Duncan, Donald, Daffy
 
 J: John
 
 M: Mark, Mike
 
 P: Penelope
 
 D:
 J:
 M:
 P:
 
 */

var namesDictionary: [Character:[String]] = [:]

for name in names{
    
    //First letter
    let firstLetter = name.lowercased().first! // D
    
    //Use the first letter to get the existing list, if there is no list, you will get nil, so you will instantiate a new list
    var list = namesDictionary[firstLetter] == nil ? [] : namesDictionary[firstLetter]!
    
//    var list: [String] = []
//
//    if(namesDictionary[firstLetter!] != nil){
//        list = namesDictionary[firstLetter!]!
//    }
    
    //append to the list
    list.append(name) // ["Duncan", "Donald"]
    
    //replace existing list with appending list
    namesDictionary[firstLetter] = list
    
}


for key in namesDictionary.keys.sorted(){
    
    let list = namesDictionary[key]!
    
    for name in list{
        print(name)
    }
    
}

print(printNameAtSectionRow(section: 1, row: 1))

func printNameAtSectionRow(section: Int, row: Int) -> String{
    
    //letter of the first section
    let letter = namesDictionary.keys.sorted()[section] //D
        
    //namesDictionary.keys.sorted() -> list [A, D, J, M, P]
    
    //get the list of the first section
    let list = namesDictionary[letter]!
    
    //get the name at the row
    return list[row]
    
}





