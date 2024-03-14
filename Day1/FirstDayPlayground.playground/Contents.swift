import Cocoa


/* variables
 Variables: allow us to store temporary information in our program,
 and form a key part of almost every Swift program. */

var greeting = "Hello, playground"

/*Once you create a variable using var, you can change it
 as often as you want without using var again. For example:*/

var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"
print(favoriteShow)

/* Strings & Integers
 Swift is what’s known as a type-safe language, which means that every variable must
 be of one specific type. The str variable that Xcode created for us holds a string of
 letters that spell “Hello, playground”,so Swift assigns it the type String.*/

var stringValue = "Hello, playground"

//On the other hand, if we want to store someone’s age we might make a variable like this:
var age = 38
//That holds a whole number, so Swift assigns the type Int – short for “integer”.

var population = 8_000_000 // this don’t change the number but do make it easier to read

//Multi-line strings
var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""
print(str1)
print(str2)

//Doubles & Booleans
//Whenever you create a variable with a fractional number, Swift automatically gives that
//variable the type Double. For example:
var pi = 3.141

var awesome = true //boolean

//When creating a numeric variable, Swift decides whether to consider it an integer or a
//double based on whether you include a decimal point. For example:
var myInt = 1
var myDouble = 1.0

//String interpolation
/*Swift gives us string interpolation as a way of injecting custom data into strings at
 runtime: it replaces one or more parts of a string with data provided by us.*/
var score = 85
var str = "Your score was \(score)" // “Your score was 85”.
var results = "The test results are here: \(str)"

var city = "Cardiff"
var message = "Welcome to \(city)!"

//Constants
/*The let keyword creates constants, which are values that can be set once and never again.
Constants don’t let us change values once they are set.
For example: */
let taylor = "swift"

//Type annotations
let str = "Hello, playground" // type inference
//That will make str a string. you can’t try to assign i an integer boolean later on

/*If you want you can be explicit about the type of your data rather than relying on
 Swift’s type inference, like this:*/
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true


/* NOTES
 1.You make variables using var and constants using let. It’s preferable to use constants as
 often as possible.
 
 2.Strings start and end with double quotes, but if you want them to run across multiple lines
 you should use three sets of double quotes.
 
 3.Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
 
 4.String interpolation allows you to create strings from other variables and constants,
 placing their values inside your string.
 
 5.Swift uses type inference to assign each variable or constant a type, but you can provide
 explicit types if you want.
 */

