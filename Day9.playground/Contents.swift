import Cocoa

//Initializers
/*
 By default, all Swift structs get a synthesized memberwise initializer by default, which means that we
 automatically get an initializer that accepts values for each of the struct’s properties.
 */
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
//You don’t write func before initializers, but you do need to make sure all properties have a value
//before the initializer ends.

//Now our initializer accepts no parameters, we need to create the struct like this:
var user = User()
user.username = "user"

struct Employee {
    var name: String
    var yearsActive = 0
    
    init() {
            self.name = "Anonymous"
            print("Creating an anonymous employee…")
        }
}
//Swift removes the memberwise initializer if you create an initializer of your own


struct Employee2 {
    var name: String
    var yearsActive = 0
}

extension Employee2 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee2(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee2()


//Referring to the current instance
//Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used.
/*
If you create a Person struct with a name property, then tried to write an initializer that accepted a name parameter, self
helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the
parameter.
 */
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}
let p = Person(name: "Ensar")


//Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
struct Person2 {
    var name: String
//what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property,
//then Swift will only create the FamilyTree struct when it’s first accessed:
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
let taylor = Student(name: "Taylor")
ed.familyTree
/*
 Swift’s lazy properties let us delay the creation of a property until it’s actually used, which makes them like a computed
 property. However, unlike a computed property they store the result that gets calculated, so that subsequent accesses to the
 property don’t redo the work.
 */
//Because lazy properties change the underlying object they are attached to, you can’t use them on constant structs.


//Static properties and methods
//You can ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.

struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
//Because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize:
var student1 = Student(name: "A")
print(Student.classSize)


struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}


//Access control
struct Person3 {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}


struct Person4 {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person4(ssn: "555-55-5555")


struct Contributor {
    private var name = "Anonymous"
}
let paul = Contributor()


struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])


//SUMMARY
/*
 1.You can create your own types using structures, which can have their own properties and methods.
 
 2.You can use stored properties or use computed properties to calculate values on the fly.
 
 3.If you want to change a property inside a method, you must mark it as mutating.
 
 4.Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own
 you must give all properties a value.
 
 5.Use the self constant to refer to the current instance of a struct inside a method.
 
 6.The lazy keyword tells Swift to create properties only when they are first used.
 
 7.You can share properties and methods across all instances of a struct using the static keyword.
 
 8.Access control lets you restrict what code can use properties and methods.
 */
