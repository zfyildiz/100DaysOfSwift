import Cocoa

//Functions (let us re-use code)
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}
printHelp()

func square(number: Int) {
    print(number * number)
}
//That tells Swift we expect to receive an Int, and it should be called number.
square(number: 8)

//Returning values
//We could rewrite our square() function to return a value rather than print it directly:
func square2(number: Int) -> Int {
    return number * number
}
let square = square2(number: 8)
print(square)

func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}
print(greet(name:"zfy"))

//How can you return two or more values from a function?
/*
 Tuples can solve the problem by letting us be specific about what data will come back:
 its name, its type, its order, and whether it’s optional or not.
 */
func getUser() -> (first: String, last: String) {
    (first: "Zeynep Feyza", last: "Yıldız")
}

let user = getUser()
print(user.first)

//Parameter labels
/*
 Swift lets us provide two names for each parameter: one to be used externally when calling
 the function, and one to be used internally inside the function.
 */
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
/*The parameter is called to name, which means externally it’s called to, but internally it’s called name.
 This gives variables a sensible name inside the function, but means calling the function reads naturally:*/
sayHello(to: "ZFY")

func setAge(for person: String, to value: Int) {
    print("\(person) is now \(value)")
}
setAge(for: "Paul", to: 40)
//If we had only used the person and value labels, we would have to write this instead:
// setAge(person: "Paul", value: 40)

//Omitting parameter labels /underscore)
func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("Zeynep")

//Default Parameters:

//You can give your own parameters a default value just by writing an = after its type
//followed by the default you want to give it.
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

//That can be called in 2 ways
greet("Taylor")
greet("Taylor", nicely: false)

//QUESTION: When the use default parameters?
//When we want to call a function using default values we can just ignore the parameters
//entirely – as if they didn’t exist
func findDirections(from: String, to: String, route: String = "fastest", avoidHighways: Bool = false) {
    // code here
}
findDirections(from: "London", to: "Glasgow")
findDirections(from: "London", to: "Glasgow", route: "scenic")
findDirections(from: "London", to: "Glasgow", route: "scenic", avoidHighways: true)

//Variadic Functions
//Swift’s variadic functions let us accept any number of parameters of the same type, separated by a comma.
print("Haters", "gonna", "hate") //print is variadic

//You can make any parameter variadic by writing ... after its type. For Example:
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1, 2, 3, 4, 5)

//Writing throwing functions
/*
 First we need to define an enum that describes the errors we can throw.
 These must always be based on Swift’s existing Error type.
 */
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}
try checkPassword("pass")

enum CatProblems: Error {
    case notACat
    case unfriendly
}
func strokeCat(_ name: String) throws {
    if name == "Mr Bitey" {
        throw CatProblems.unfriendly
    } else if name == "Lassie" {
        throw CatProblems.notACat
    } else {
        print("You stroked \(name).")
    }
}
try strokeCat("Mt Bitey")
