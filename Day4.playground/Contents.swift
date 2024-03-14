import Cocoa

//For Loops
let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

//Why does Swift use underscores with loops?
let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
    print("\(name) is a secret agent")
}
//Every time the loop goes around, Swift will take one item from the names array, put it into the name constant, then execute the body of our loop.

//Sometimes you don’t actually need the value that is currently being read, which is where the underscore comes in:
let name = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for _ in name {
    print("[CENSORED] is a secret agent!")
}

//While Loops
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

//When should you use a while loop?
/*The main difference is that for loops are generally used with finite sequences: we loop through the
 numbers 1 through 10, or through the items in an array, for example. On the other hand, while loops can
 loop until any arbitrary condition becomes false, which allows them until we tell them to stop.*/


//Repeat Loop
//Because the condition comes at the end of the repeat loop the code inside the loop will always be executed at least once

var num = 1

repeat {
    print(num)
    num += 1
} while num <= 20

print("Ready or not, here I come!")

repeat {
    print("This is false")
} while false

//When should you use a repeat loop?
//Example:
let nums = [1, 2, 3, 4, 5]
var random = nums.shuffled()

while random == nums {
    random = nums.shuffled()
}
//As you can see, that means we’ve repeated shuffled() in two places.
//(DRY: Don't Repeat Yourself)
let numbers = [1, 2, 3, 4, 5]
var randm: [Int]

repeat {
    randm = numbers.shuffled()
} while randm == numbers

//You can exit a loop at any time using the break keyword.
var countDown = 10
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

//For example, if you had an array of scores and you want to figure out how many of them the player achieved without getting a 0, you might write this:
let scores = [1, 8, 4, 3, 0, 5, 2]
var count1 = 0

for score in scores {
    if score == 0 {
        break
    }

    count1 += 1
}

print("You had \(count1) scores before you got 0.")

//Exiting multiple loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

//as soon as the combination is found, exit all the loops at once
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

//Skipping items
// if you just want to skip the current item and continue on to the next one, you should use continue
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

//Infinite loops
/* For example, all the apps you use on your iPhone have infinite loops. Think about it: when your app
 launches it needs to repeat a series of instructions until it’s told to stop: */
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

//SUMMARY
/*
 1.Loops let us repeat code until a condition is false.
 
 2.The most common loop is for, which assigns each item inside the loop to a temporary constant.
 
 3.If you don’t need the temporary constant that for loops give you, use an underscore instead so
 Swift can skip that work.
 
 4.There are while loops, which you provide with an explicit condition to check.
 
 5.Although they are similar to while loops, repeat loops always run the body of their loop at least once.
 
 6.You can exit a single loop using break, but if you have nested loops you need to use break followed by
 whatever label you placed before your outer loop.
 
 7.You can skip items in a loop using continue.
 
 8.Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a
 condition somewhere to end your infinite loops!
 */
