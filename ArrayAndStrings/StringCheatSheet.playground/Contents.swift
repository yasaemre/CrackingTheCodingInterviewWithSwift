import UIKit

var emptyString = "" //Empty(Mutable) String
let stillEmpty = String()//Another empty string
let helloWorld = "Hello World!" //String literal

let a = String(true) // from boolean: "true"
let b: Character = "A"  //Explicit type to create a Character
let c = String(b)  //from character "A"
let d = String(3.14) //from double "3.14"
let f = String(1000) //from integer "1000"
let g = "\u{2126}" //Omega sign

let hex = String(254, radix: 16, uppercase: true) // "FE"
let octal = String(18, radix: 8) //22

//Creating a string with repeating values
let h = String(repeating: "01", count: 3)

//Create a string from a file
if let txtPath = Bundle.main.path(forResource: "lorem", ofType: "txt") {
    do {
        let lorem = try String(contentsOfFile: txtPath, encoding: .utf8)
    } catch {
        print("Something went wrong")
    }
}

let verse = """
To be, or not to be - that is the question;
Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles,
"""
let indentedText = """
This is a single longe line split \
over two lines by escaping the newline.
"""

let title = "Insert \"title\" here"

let title2 = #"Insert "title" here"#

let regex1 = ##""Hello""##

let name = "Tom"
let greeting2 = #"Hello \#(name)"#

let json1 = """
{
  "colors": ["red","green","blue"],
  "label": "Insert \"title\" here"
}
"""

//Strings are value types as Structs
let name2 = ""
name2.isEmpty

let title3 = String()
title3.isEmpty

let line = "0001 Some test data here %%%%"
line.hasPrefix("0001")
line.hasSuffix("%%%%")

let spain = "España"
let tilde = "\u{303}"
let country = "Espan" + "\(tilde)" + "a"
if country == spain {
  print("Matched!")       // "Matched!\n"
}


country.unicodeScalars
country.utf16
country.utf8

for character in country {
    print(character)
}

country.first
country.last

let suits = "♠︎♣︎♥︎♦︎"
suits.randomElement()


//iterate over shuffled string
for suit in suits.shuffled() {
    print(suit)
}

//Counting
spain.count
spain.unicodeScalars.count
spain.utf16.count
spain.utf8.count

//Charcter properties
//Note: These characters operate on charecters, not string
let aChar = "A" as Character
let pi = "π" as Character

aChar.isASCII
pi.isASCII

aChar.asciiValue
pi.asciiValue

let hello = "hello"
let startIndex = hello.startIndex // 0
let endIndex = hello.endIndex     // 5 note: you cannot use end index as a subscript, out of range
hello[startIndex]                 // "h"

hello[hello.index(after: startIndex)] //e
hello[hello.index(before: endIndex)] //o
