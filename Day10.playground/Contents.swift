import Cocoa

//CLASSES
/*Classes are similar to structs in that they allow you to create new types with properties and methods.
 The first difference between classes and structs is that classes never come with a memberwise initializer.
 This means if you have properties in your class, you must always create your own initializer.*/

class VideoGame {
    var hero: String
    var enemy: String
    init(heroName: String, enemyName: String) {
        self.hero = heroName
        self.enemy = enemyName
    }
}
let monkeyIsland = VideoGame(heroName: "Guybrush Threepwood", enemyName: "LeChuck")

/*
 Classes and structs have five important differences:

 1.Classes do not come with synthesized memberwise initializers.
 
 2.One class can be built upon (“inherit from”) another class, gaining its properties and methods.
 
 3.Copies of structs are always unique, whereas copies of classes actually point to the same shared data.
 
 4.Classes have deinitializers, which are methods that are called when an instance of the class is destroyed, but structs do not.
 
 5.Variable properties in constant classes can be modified freely, but variable properties in constant structs cannot.
 */

class BoardGame {
    var name: String
    var minimumPlayers = 1
    var maximumPlayers = 4
    init(name: String) {
        self.name = name
    }
}



class Empty { }
let nothing = Empty()


//Class inheritance (Subclass)
//the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
//We could create a new class based on that one called Poodle. It will inherit the same properties and initializer as Dog by default:
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
/*However, we can also give Poodle its own initializer. We know it will always have the breed “Poodle”, so we can make a new
initializer that only needs a name property. We can make the Poodle initializer call the Dog initializer directly so that all the
same setup happens.*/


class Handbag {
    var price: Int
    init(price: Int) {
        self.price = price
    }
}
class DesignerHandbag: Handbag {
    var brand: String
    init(brand: String, price: Int) {
        self.brand = brand
        super.init(price: price)
    }
}

//For safety reasons, Swift always makes you call super.init() from child classes.

class Product {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Book: Product {
    var isbn: String
    init(name: String, isbn: String) {
        self.isbn = isbn
        super.init(name: name)
    }
}


class Instrument {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Piano: Instrument {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
        super.init(name: "Piano")
    }
}


//Overriding methods
class Store {
    func restock() -> String {
        return "Fill up the empty shelves"
    }
}
class GroceryStore: Store {
    override func restock() -> String {
        return "We need to buy more food."
    }
}
let tesco = GroceryStore()
tesco.restock()


//Final classes
//When you declare a class as being final, no other class can inherit from it.
final class Dog2 {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}


//Copying objects
/*
 When you copy a struct, both the original and the copy are different things – changing one won’t change the other.
 When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.
*/
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

/*Because of the way classes work, both singer and singerCopy point to the same object in memory,
 so when we print the singer name again we’ll see “Justin Bieber”:*/
var singerCopy = singer
singerCopy.name = "Justin Bieber"
print(singer.name)

//if Singer were a struct then we would get “Taylor Swift” printed a second time


/*
 Structs are value types, which means they hold simple values such as the number 5 or the string “hello”. It doesn’t
 matter how many properties or methods your struct has, it’s still considered one simple value like a number. On the
 other hand, classes are reference types, which means they refer to a value somewhere else. In this case, using a class
 rather than a struct sends a strong message that you want the data to be shared somehow, rather than having lots of
 distinct copies.
 */
class Author {
    var name = "Anonymous"
}
var dickens = Author()
dickens.name = "Charles Dickens"
var austen = dickens
austen.name = "Jane Austen"
print(dickens.name)
print(austen.name)



//Deinitializers
//The job of deinitializers is to tell us when a class instance was destroyed.
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
/*Behind the scenes Swift performs something called automatic reference counting, or ARC. ARC tracks how many copies of each class
 instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed
 Swift subtracts 1 from its reference count. When the count reaches 0 it means no one refers to the class any more, and Swift will call
 its deinitializer and destroy the object.*/

//Mutability
/*If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.
 However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the
 mutating keyword with methods that change properties; that’s only needed with structs.*/
class Singer2 {
    var name = "Taylor Swift"
}

let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)

//If you want to stop that from happening you need to make the property constant: class Singer { let name = "Taylor Swift" }

class Sun {
    var isNova = false
    func goNova() {
        isNova = true
    }
}
let sun = Sun()
sun.goNova()
//The reason for this lies in the fundamental difference between a class and a struct: one points to some data in memory,
//whereas the other is one value such as the number 5.

//SUMMARY OF THE DAY
/*
 1.Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 
 2.One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about
 class hierarchies – one class based on another, which itself is based on another.
 
 3.You can mark a class with the final keyword, which stops other classes from inheriting from it.
 
 4.Method overriding lets a child class replace a method in its parent class with a new implementation.
 
 5.When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 
 6.Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 
 7.Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of
 how the class instance was created.
 */
