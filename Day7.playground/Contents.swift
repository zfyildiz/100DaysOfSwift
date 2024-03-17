import Cocoa

//CLOSURES

//Using closures as parameters when they accept parameters
/*
 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can
 go ahead and fill the () with the types of any parameters that your closure should accept.
 */
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel { (place: String) in
    print("I'm going to \(place) in my car")
}

//Example
func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}

//Using closures as parameters when they return values
/*
 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”,
 but you can replace that Void with any type of data to force the closure to return a value.
 */
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}


//Using closures as parameters when they return values
func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    // start with a total equal to the first value
    var current = values[0]

    // loop over all the values in the array, counting from index 1 onwards
    for value in values[1...] {
        // call our closure with the current value and the array element, assigning its result to our current value
        current = closure(current, value)
    }

    // send back the final current value
    return current
}

let numbers = [10, 20, 30]

let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}

print(sum)
/*
Swift’s operators are actually functions in their own right.
For example, + is a function that accepts two numbers (e.g. 5 and 10) and returns another number (15).
 */
let sum2 = reduce(numbers, using: +)
print(sum2)

//EXAMPLE
func encrypt(password: String, using algorithm: (String) -> String) {
    print("Encrypting password...")
    let result = algorithm(password)
    print("The result is \(result)")
}
encrypt(password: "t4ylor") { (password: String) in
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}

//Shorthand parameter names
/*
 Swift gives us a special shorthand parameter syntax that makes it extremely concise to write closures.
 This syntax automatically numbers parameter names as $0, $1, $2, and so on
 */
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
//We can call travel2() using something like this:
travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
//However, Swift knows the parameter to that closure must be a string and return a string:
travel2 { place in
    return "I'm going to \(place) in my car"
}

//As the closure only has one line of code that must be the one that returns the value,
//so Swift lets us remove the return keyword too:
travel2 { place in
    "I'm going to \(place) in my car"
}

/*
 Rather than writing place in we can let Swift provide automatic names for the closure’s parameters.
 These are named with a dollar sign, then a number counting from 0.
 */
travel2 {
    "I'm going to \($0) in my car"
}
// If you need to refer to $0 more than maybe two or three times, you should probably just give it a real name.


//Closures with multiple parameters
func travel3(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
travel3 {
    "I'm going to \($0) at \($1) miles per hour."
}

//Returning closures from functions
func travel4() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
/*
 travel4() function accepts no parameters, but returns a closure.
 The closure that gets returned must be called with a string, and will return nothing.
 */
let result2 = travel4()("London")

//another example
func createValidator() -> (String) -> Bool {
    return {
        if $0 == "twostraws" {
            return true
        } else {
            return false
        }
    }
}
let validator = createValidator()
print(validator("twostraws"))

//another example
func createTravelMethod(distance: Int) -> (String) -> Void {
    if distance < 5 {
        return {
            print("I'm walking to \($0).")
        }
    } else if distance < 20 {
        return {
            print("I'm cycling to \($0).")
        }
    } else {
        return {
            print("I'm driving to \($0).")
        }
    }
}
let travelMethod = createTravelMethod(distance: 15)
travelMethod("London")

//Capturing values
//If you use any external values inside your closure, Swift captures them – stores them alongside the closure
func travel5() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result = travel5()
result("London")
result("London")
result("London")

//SUMMARY
/*
1.You can assign closures to variables, then call them later on.
 
2.Closures can accept parameters and return values, like regular functions.
 
3.You can pass closures into functions as parameters, and those closures can have parameters of their
 own and a return value.
 
4.If the last parameter to your function is a closure, you can use trailing closure syntax.
 
5.Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
 
6.If you use external values inside your closures, they will be captured so the closure can refer to them later.

 */
