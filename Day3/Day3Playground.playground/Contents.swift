import Cocoa
//Arithmetic Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore

let weeks = 465 / 7
let days = 465 % 7
print("There are \(weeks) weeks and \(days) days until the event.")

let number = 465
let isMultiple = number.isMultiple(of: 7)

//Swift supports operator overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42

//But + also joins strings, like this:
let fakers = "Fakers gonna "
let action = fakers + "fake"

//You can even use + to join arrays, like this:
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

//Remember, Swift is a type-safe language, which means it won’t let you mix
//types. For example, you can’t add an integer to a string because it doesn’t
//make any sense.

//Compound assignment operators
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//Comparison operators
let first = 6
let second = 4

first == second
first != second

first < second
first >= second

"Taylor" <= "Swift"

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

enum Sizes: Comparable {
    case small
    case medium
    case large
}

let firstt = Sizes.small
let secondd = Sizes.large
print(firstt < secondd)
//That will print “true”, because small comes before large in the enum case list.

//Conditions
var firstCard = 11
var secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// &&: and operator
// ||: or operator

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}
 
var isOwner = true
var isEditingEnabled = true
var isAdmin = false
if (isOwner == true && isEditingEnabled) || isAdmin == true {
    print("You can delete this post")
}

//Ternary operator
firstCard = 11
secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

let isAuthenticated = true
print(isAuthenticated ? "Welcome!" : "Who are you?")

//If you have several conditions using if and else if, it’s often clearer to use
//a different construct known as switch case.
let weather = "sunny"
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

//Range operators

//Swift gives us two ways of making ranges: the ..< and ... operators.
//For example, the range 1..<5 contains the numbers 1, 2, 3, and 4, whereas the range 1...5 contains the numbers 1, 2, 3, 4, and 5.
let score1 = 85

switch score1 {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

let names = ["Piper", "Alex", "Suzanne", "Gloria", "Zeynep", "Feyza"]
print(names[0])
print(names[1...3])
print(names[1...])

//SUMMARY
/*
 1.Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 
 2.There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 
 3.You can use if, else, and else if to run code based on the result of a condition.
 
 4.Swift has a ternary operator that combines a check with true and false code blocks.
 
 5.If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 
 6.You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
 */
