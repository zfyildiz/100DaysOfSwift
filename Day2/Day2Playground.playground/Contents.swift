import Cocoa

//Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo] //this line makes the array
//You can read values from an array:
beatles[1]
//Be careful: Swift crashes if you read an item that doesn’t
//exist. For example, trying to read beatles[9] is a bad idea.

var cities: [String] = ["London", "Paris", "New York"]
//Note: If you’re using type annotations, arrays are written
//in brackets: [String], [Int], [Double], and [Bool].

//Sets
/*
Sets are collections of values just like arrays, except they
 have two differences:
 Sets are unordered and cannot contain duplicates,
 whereas arrays retain their order and can contain duplicates.
 
 Those two differences might seem small, but they have an
 interesting side effect: because sets don’t need to store
 your objects in the order you add them, they can instead
 store them in a seemingly random order that optimizes them
 for fast retrieval. So, when you say “does this set contain
 item X,” you’ll get an answer in a split second no matter how
 big the set is.
 */
let colors = Set(["red", "green", "blue"])

/*If you try to insert a duplicate item into a set, the
 duplicates get ignored. For example: */
let colors2 = Set(["red", "green", "blue", "red", "blue"])

//Tuples
//Tuples are fixed in size & types. Accessed by index or name.
//Swift prevents accessing non-existent values.
//Remember, you can change the values inside a tuple after you create
//it, but not the types of values. So, if you tried to change name to be
//(first: "Justin", age: 25) you would get an error.
var name = (first: "Taylor", last: "Swift")
name.0
name.last

//If you need a specific, fixed collection of related values where each item
//has a precise position or name, you should use a tuple:
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

//If you need a collection of values that must be unique or you need to be able
//to check whether a specific item is in there extremely quickly, you should use a set:
let set = Set(["aardvark", "astronaut", "azalea"])

//If you need a collection of values that can contain duplicates, or the order
//of your items matters, you should use an array:
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

//Dictionary [key:value]
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]
/*Note: When using type annotations, dictionaries are written in brackets with a
 colon between your identifier and value types. For example, [String: Double] and [String: String].
*/
let capitals : [String: String] = [
    "Turkey": "Ankara",
    "Germany": "Berlin",
    "France": "Paris",
    "Italy": "Rome"
]
/*Dictionaries don’t store our items using an index, but instead they optimize the
 way they store items for fast retrieval. So, when we say user["country"] it will
 send back the item at that key (or nil) instantly, even if we have a dictionary with
 100,000 items inside.*/

/*If you try to read a value from a dictionary using a key that doesn’t exist,
 Swift will send you back nil – nothing at all. While this might be what you want, there’s
 an alternative: we can provide the dictionary with a default value to use if we request a missing key.
*/
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"]
favoriteIceCream["Charlotte", default: "Unknown"]

//If you want to create an empty collection just write its type followed by opening and closing parentheses.
//an empty dictionary
var teams = [String: String]()
teams["Paul"] = "Red"

//an empty array
var results = [Int]()

// empty sets
var words = Set<String>()
var numbers = Set<Int>()

//If you wanted, you could create arrays and dictionaries with similar syntax:
var scores = Dictionary<String, Int>()
var result = Array<Int>()

//Enumerations

enum Direction {
    case north
    case west
    case east
    case south
}
var direction = Direction.east

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}
let speed = Weather.windy(speed: 20)

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 3)

enum Mood: Int {
    case happy
    case sad
    case grumpy
    case sleepy
    case hungry
}

let moodNumber = Mood.grumpy.rawValue

//SUMMARY OF THE DAY
/*
 1.Arrays, sets, tuples, and dictionaries let you store a group of items under a single value.
 They each do this in different ways, so which you use depends on the behavior you want.
 
 2.Arrays store items in the order you add them, and you access them using index.
 
 3.Sets store items without any order, so you can’t access them using index.
 
 4.Tuples are fixed in size, and you can attach names to each of their items. You can read items
 using index or using your names.
 
 5.Dictionaries store items according to a key, and you can read items using those keys.
 
 6.Enums are a way of grouping related values so you can use them without spelling mistakes.
 
 7.You can attach raw values to enums so they can be created from integers or strings, or you can
 add associated values to store additional information about each case.
 */
