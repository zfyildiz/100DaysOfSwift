import Cocoa

//Protocols
//Protocols are a way of describing what properties and methods something must have.

protocol Identifiable {
    var id: String { get set }
}
//We can’t create instances of that protocol - it’s a description of what we want, rather than something we can
//create and use directly.
struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//Protocols let us define how structs, classes, and enums ought to work: what methods they should have,
//and what properties they should have.
protocol Purchaseable {
    var name: String { get set }
}
struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}

//NOTE:It's not possible to create set-only properties in Swift.


//Protocol Inheritance
/*
 One protocol can inherit from another in a process known as protocol inheritance. Unlike with classes, you can
 inherit from multiple protocols at the same time before you add your own customizations on top.
 */
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
//Now we can make new types conform to that single protocol rather than each of the three individual ones:
protocol Employee: Payable, NeedsTraining, HasVacation { }

//Anoyher example
protocol Product {
    var price: Double { get set }
    var weight: Int { get set }
}
protocol Computer: Product {
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}
protocol Laptop: Computer {
    var screenSize: Int { get set }
}

/*When should we use protocol inheritance?
 Think about it: if we can know whether an object is less than or greater than some other object, then we must also be able to
 know when it is the same as the other object. Rather than copy all the functionality of Equatable into Comparable, Swift just
 uses protocol inheritance so that Comparable inherits from Equatable.
 */


//Extensions
//Extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do.
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 8
number.squared()

//Swift doesn’t let you add stored properties in extensions, so you must use computed properties instead.
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//Protocol extensions
/*Protocols let you describe what methods something should have, but don’t provide the code inside. Extensions let you provide
 the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time.
 Protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type
 you extend a whole protocol so that all conforming types get your changes.
 */
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
//Swift’s arrays and sets both conform to a protocol called Collection
extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

protocol Politician {
    var isDirty: Bool { get set }
    func takeBribe()
}
extension Politician {
    func takeBribe() {
        if isDirty {
            print("Thank you very much!")
        } else {
            print("Someone call the police!")
        }
    }
}

//Protocol-oriented programming
/*Protocol extensions can provide default implementations for our own protocol methods. This makes it easy for types to conform to a protocol,
 and allows a technique called “protocol-oriented programming” – crafting your code around protocols and protocol extensions*/
protocol Identifiable2 {
    var id: String { get set }
    func identify()
}
extension Identifiable2 {
    func identify() {
        print("My ID is \(id).")
    }
}
struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()

//How is protocol-oriented programming different from object-oriented programming?
/*There is no practical difference between the two. In fact, the only important difference between the two is one of mindset: POP developers lean
 heavily on the protocol extension functionality of Swift to build types that get a lot of their behavior from protocols. This makes it easier to
 share functionality across many types, which in turn lets us build bigger, more powerful software without having to write so much code.*/

//SUMMARY OF THE DAY
/*
 1.Protocols describe what methods and properties a conforming type must have, but don’t provide the implementations of those methods.
 
 2.You can build protocols on top of other protocols, similar to classes.
 
 3.Extensions let you add methods and computed properties to specific types such as Int.
 
 4.Protocol extensions let you add methods and computed properties to protocols.
 
 5.Protocol-oriented programming is the practice of designing your app architecture as a series of protocols, then using protocol extensions to provide
 default method implementations.
 */
