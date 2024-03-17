import Cocoa

//Structs
struct Sport {
    var name: String
}
//That defines the type now we can create and use an instance of it:
var tennis = Sport(name: "Tennis")
print(tennis.name)
//We made both name and tennis variable, so we can change them just like regular variables:
tennis.name = "Lawn tennis"
//Properties can have default values just like regular variables

//Example struct
struct Book {
    var title: String
    var author = "Unknown"
    var pageCount = 0
}

//What’s the difference between a struct and a tuple?
struct User {
    var name: String
    var age: Int
    var city: String
}
//Using struct
func authenticate(_ user: User) {  }
func showProfile(for user: User) {  }
func signOut(_ user: User) {  }

//Using tuple
func authenticate(_ user: (name: String, age: Int, city: String)) {  }
func showProfile(for user: (name: String, age: Int, city: String)) { }
func signOut(_ user: (name: String, age: Int, city: String)) {  }

/*
 So, use tuples when you want to return two or more arbitrary pieces of values from a function,
 but prefer structs when you have some fixed data you want to send or receive multiple times.
 */


//Computed properties
struct Sport2 {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
/*
 As you can see, olympicStatus looks like a regular String, but it returns different values
 depending on the other properties.
 */
let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// NOTE: Constants cannot be computed properties.


//Property observers
//Property observers let you run code before or after any property changes.

/*
 What we want to happen is for Swift to print a message every time amount changes, and we can use a
 didSet property observer for that. This will run some code every time amount changes:
 */
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//Methods
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
//That method belongs to the struct, so we call it on instances of the struct like this:
let london = City(population: 9_000_000)
london.collectTaxes()

//What’s the difference between a function and a method?
/*
 the only real difference is that methods belong to a type, such as structs, enums, and classes,
 whereas functions do not.
 */


//Mutating methods
//When you want to change a property inside a method, you need to mark it using the mutating keyword, like this:
struct Person {
    var name: String

    mutating func makeAnonymous() {
        print(name)
        name = "Anonymous"
        print(name)
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()


//Properties and methods of strings
/*
 Almost all of Swift’s core types are implemented as structs, including strings, integers, arrays, dictionaries,
 and even Booleans. This isn’t an accident: structs are simple, fast, and efficient in Swift, which means we can
 create and destroy them as much as we need without worrying too much about performance.
 */
//As a result, Swift encapsulates all the functionality to handle strings into the string themselves.
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.hasPrefix("Hello"))
print(string.uppercased())
print(string.sorted())


//Properties and methods of arrays
/*
 Arrays are also structs, which means they too have their own methods and properties we can use to query and
 manipulate the array.
 */
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
print(toys)
