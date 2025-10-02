import UIKit

// Problem 1: FizzBuzz
for num in 1...100 {
    if num % 3 == 0 && num % 5 == 0{
        print("\(num) is FizzBuzz")
    }
    else if num % 3 == 0{
        print ("\(num) is Fizz")
    }
    else if num % 5 == 0{
        print ("\(num) is Buzz")
    }
    
}

// Problem 2: Prime Numbers

func isPrime(_ number: Int)-> Bool{
    if number < 2{
        print("\(number) is not a prime number")
        return false
        
    }
    for i in 2..<number{
        if number % i == 0 {
            print("\(number) is not a prime number")
            return false
        }
    }
    print( "\(number) is a prime number")
    return true
}
    
for num in 1...100{
    isPrime(num)
}

//Problem 3: Temperature Converter

func FahrenheitToCelsius(_ fahrenheit: Double) -> Double{
    return (fahrenheit - 32) * 5/9
}

func CelsiusToFahrenheit(_ celsius: Double) -> Double{
    return celsius * 9/5 + 32
}
func CelsiusToKelvin(_ celsius: Double) -> Double{
    return celsius + 273.15
}
func KelvinToCelsius(_ kelvin: Double) -> Double{
    return kelvin - 273.15
}
func KelvinToFahrenheit(_ kelvin: Double) -> Double{
    return (kelvin - 273.15) * 9/5 + 32
}

func FahrenheitToKelvin(_ fahrenheit: Double) -> Double{
    return (fahrenheit + 459.67) * 5/9
}
print("Enter a number:")
if let input = readLine(), let number = Double(input) {
    print("Which conversion would you like to perform? (C, F, or K).")
    if let conversionType = readLine(){
        switch conversionType.uppercased() {
        case "C":
            print ("\(number) degrees Celsius is equal to \(CelsiusToFahrenheit(number)) degrees Fahrenheit and \(CelsiusToKelvin(number)) degrees Kelvin.")
        case "F":
            print ("\(number) degrees Fahrenheit is equal to \(FahrenheitToCelsius(number)) degrees Celsius and \(FahrenheitToKelvin(number)) degrees Kelvin.")
        case "K":
            print( "\(number) degrees Kelvin is equal to \(KelvinToCelsius(number)) degrees Celsius and \(KelvinToFahrenheit(number)) degrees Fahrenheit.")
        default :
            print("Invalid conversion type")
        }
    }
} else {
    print("Invalid input")
}

//Problem 4: Shopping List Manager

var shoppingList: [String] = []
var running = true
while running {
    print("1.Add item\n 2. Remove item\n 3. Show list\n 4. Exit")
    if let choice = readLine(), let intChoice = Int(choice){
        switch intChoice{
        case 1:
        print( "Enter item to add:")
        if let itemToAdd = readLine(){
            shoppingList.append(itemToAdd)
        }
        case 2:
            print("Enter item to remove")
            if let itemToRemove = readLine(), let index = shoppingList.firstIndex(of: itemToRemove){
                shoppingList.remove(at: index)
            }
        case 3:
            print(shoppingList)
        case 4:
            print( "Goodbye!")
            running=false
        default:
            print( "Invalid choice")
        }
    }
}

//Problem 5: Word Frequency Counter

import Foundation

var frequencyDictionary: [String: Int] = [:]

print("Enter a sentence:")
if let input = readLine(){
    let clean = input.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: " ")
let words = clean.split(separator: " ")
    for word in words {
        let lowercasedWord = String(word).lowercased()
        if let existingFrequency = frequencyDictionary[lowercasedWord] {
            frequencyDictionary[lowercasedWord] = existingFrequency + 1
        } else {
            frequencyDictionary[lowercasedWord] = 1
        }
    }
}
for (word, count) in frequencyDictionary{
    print("\(word): \(count)")
}

//Problem 6: Fibonacci Sequence

func fibonacci(_ n: Int) -> [Int] {
    if n<=0{
        return []
    }
    if n==1{
        return [0]
    }
    if n==2{
        return [0,1]
    }
    else{
        var sequence: [Int] = [0,1]
        for i in 2..<n{
            let nextNumber = sequence[i-1]+sequence[i-2]
            sequence.append(nextNumber)
        }
        return sequence
    }
}

print(fibonacci(10))

//Problem 7: Grade Calculator

let students: [String:Int] = ["Azamat":95, "Dilara":88, "Nazerke":79, "Nilufar":92]
 
func average(_ scores:[String:Int]) -> Double {
    var total:Int = 0
    for score in scores.values{
        total += score
    }
    return Double(total)/Double(scores.count)
}
func highestAndLowest(_ scores:[String:Int]) -> String{
    var min = scores.values.first!
    var max = scores.values.first!
    for scores in scores.values{
        if scores<min{
            min=scores
        }
        else if scores>max{
            max=scores
        }
    }
    return "Highest: \(max), Lowest: \(min)"
    
}

func aboveOrBelow(_ scores:[String:Int])-> String{
    let averageScore = average(students)
    var aboveOrBelow:[String] = []
    for (name, score) in scores{
        if Double(score)>averageScore{
            aboveOrBelow.append("\(name): \(score) is above average")
        }
        else{
            aboveOrBelow.append("\(name): \(score) is below average")
        }
        
    }
    return aboveOrBelow.joined(separator: "\n")
}

print(average(students))
print(highestAndLowest(students))
print(aboveOrBelow(students))

//Problem 8: Palindrome Checker

func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter{$0.isLetter || $0.isNumber}
    let reversedText = String(cleanedText.reversed())
    
    return cleanedText == reversedText
    
    
}
print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("No lemon, no melon"))
print(isPalindrome("Hello, world!"))
//Problem 9: Simple Calculator

func addition(_ lhs: Double, _ rhs: Double) -> Double {
    return lhs + rhs
}
func subtraction(_ lhs: Double, _ rhs: Double) -> Double {
    return lhs - rhs
}
func multiplication(_ lhs: Double, _ rhs: Double) -> Double {
    return lhs * rhs
}
func division(_ lhs: Double, _ rhs: Double) -> Double? {
    if rhs==0{
        return nil
    }
    return lhs / rhs
}

var running = true
while running {
    print("Enter your first number:", terminator: "")
    guard let lhsInput = readLine(), let lhs = Double(lhsInput) else {
        print("Invalid number")
        continue
    }
    
    print("Enter your second number:", terminator: "")
    guard let rhsInput = readLine(), let rhs = Double(rhsInput) else {
        print("Invalid number")
        continue
    }
    
    print( "Enter operation (+, -, *, /, q):", terminator: "")
    if let operation = readLine() {
        print("Enter operation type:")
        switch operation {
        case "+":
            print("Result: \(addition(lhs, rhs))")
        case "-":
            print("Result: \(subtraction(lhs, rhs))")
        case "*":
            print("Result: \(multiplication(lhs, rhs))")
        case "/":
            if let result = division(lhs, rhs){
                print("Result: \(result)")
            }
            else{
                print("Error: Division by zero")
            }
        case "q":
            running = false
        default:
            print( "Invalid choice")
        }
    }
}

//Problem 10: Unique Characters

func hasUniqueCharacters(_ text:String) -> Bool {
    var uniqueCharacters:Set<Character> = []
    
    for character in text {
        if uniqueCharacters.contains(character) {
            return false
        }
        else {
            uniqueCharacters.insert(character).inserted
            
        }
    }
    return true
}
print(hasUniqueCharacters("Zhasmin "))

