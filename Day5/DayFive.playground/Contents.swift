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

/*
 do starts a section of code that might cause problems,
 try is used before every function that might throw an error, and
 catch lets you handle errors gracefully.
 
 If any errors are thrown inside the do block, execution immediately jumps to the catch block.
 */
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

/*
 Why does Swift make us use try before every throwing function?
 Swift by forcing us to use try before every throwing function, we’re explicitly
 acknowledging which parts of our code can cause errors
 
 do {
     try throwingFunction1()
     nonThrowingFunction1()
     try throwingFunction2()
     nonThrowingFunction2()
     try throwingFunction3()
 } catch {
     // handle errors
 }
 using try makes it clear that the first, third, and fifth function calls can throw errors,
 but the second and fourth cannot.
 */

//inout parameters
/*
 All parameters passed into a Swift function are constants, so you can’t change them. If you want,
 you can pass in one or more parameters as inout, which means they can be changed inside your function,
 and those changes reflect in the original value outside the function.
 */
func doubleInPlace(number: inout Int) {
    number *= 2
}
/*
 To use that, you first need to make a variable integer – you can’t use constant integers with inout,
 because they might be changed. You also need to pass the parameter to doubleInPlace using an ampersand,
 &, before its name, which is an explicit recognition that you’re aware it is being used as inout.
 */
var myNum = 10
doubleInPlace(number: &myNum)

/*
 SUMMARY
 
 1.Functions let us re-use code without repeating ourselves.
 
 2.Functions can accept parameters – just tell Swift the type of each parameter.
 
 3.Functions can return values, and again you just specify what type will be sent back. Use tuples if you
 want to return several things.
 
 4.You can use different names for parameters externally and internally, or omit the external name entirely.
 
 5.Parameters can have default values, which helps you write less code when specific values are common.
 
 6.Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
 
 7.Functions can throw errors, but you must call them using try and handle errors using catch.
 
 8.You can use inout to change variables inside a function, but it’s usually better to return a new value.
 */
