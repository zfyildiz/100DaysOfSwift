import Cocoa

//Closures
/*
 Closures let us wrap up some functionality in a single variable, then store that somewhere.
 We can also return it from a function, and store the closure somewhere else.
 */
let driving = {
    print("I'm driving in my car")
}
//That effectively creates a function without a name, and assigns that function to driving.
driving()

//Accepting parameters in a closure
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}
driving2("London")

//here’s a function that accepts a string and an integer:
func pay(user: String, amount: Int) {
    // code
}
let payment = { (user: String, amount: Int) in
    // code
    //in keyword is there to mark the end of the parameter list and the start of the closure’s body

}

//Returning values from a closure (-> String, -> Bool, -> Int)
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

//How do you return a value from a closure that takes no parameters?
let payment2 = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

//Closures as parameters
//Because closures can be used just like strings and integers, you can pass them into functions.
let driving3 = {
    print("I'm driving in my car")
}
/*If we wanted to pass that closure into a function so it can be run inside that function,
we would specify the parameter type as () -> Void.
 */
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)

//trailing closures

func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel2 {
    print("I'm driving in my car")
}

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}
//We can call that function without a trailing closure like this:
animate(duration: 3, animations: {
    print("Fade out the image")
})
//Trailing closures allow us to clean that up, while also removing the animations parameter label.
//That same function call becomes this:
animate(duration: 3) {
    print("Fade out the image")
}

//Example of trailing closure
func makeCake(instructions: () -> Void) {
    print("Wash hands")
    print("Collect ingredients")
    instructions()
    print("Here's your cake!")
}
makeCake {
    print("Mix egg and flour")
}

//Another example
func repeatAction(count: Int, action: () -> Void) {
    for _ in 0..<count {
        action()
    }
}
repeatAction(count: 5) {
    print("Hello, world!")
}


func goCamping(then action: () -> Void) {
    print("We're going camping!")
    action()
}
goCamping {
    print("Sing songs")
    print("Put up tent")
    print("Attempt to sleep")
}


func goOnVacation(to destination: String, _ activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(to: "Mexico") {
    print("Go sightseeing")
    print("Relax in sun")
    print("Go hiking")
}
