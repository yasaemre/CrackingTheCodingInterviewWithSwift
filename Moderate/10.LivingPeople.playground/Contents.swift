import UIKit

/*
 Given a list of people with their birth and death years, implement a method to compute the year with the most number of people alive. You may assume that all people were born between 1900 and 2000 (inclusive). If a person was alive during any portion of that year, they should be included in that year's count. For example, Person (birth= 1908, death= 1909) is included in the counts for both 1908 and 1909.
 */

class Person {
    var birth:Int
    var death:Int
    
    init(_ birthYear:Int, _ deathYear:Int) {
        birth = birthYear
        death = deathYear
    }
}

func maxAliveYear(_ people:[Person], _ min:Int, _ max:Int) -> Int {
    var maxAlive = 0
    var maxAliveYear = min
    
    for year in min ... max {
        var alive = 0
        for person in people {
            if person.birth <= year && year <= person.death {
                alive += 1
            }
        }
        if alive > maxAlive {
            maxAlive = alive
            maxAliveYear = year
        }
    }
    return maxAliveYear
}
//The run time of this O(RP), where R is the range of year(100), and P is the number of people.
