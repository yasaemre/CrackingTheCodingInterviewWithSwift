import UIKit

/*
 Tim-sort
 Tim-sort is a sorting algorithm derived from insertion sort and merge sort. It was designed to perform in an optimal way on different kind of real world data. It is an adaptive sorting algorithm which needs O(n log n) comparisons to sort an array of n elements. It was designed and implemented by Tim Peters in 2002 in python programming language. It has been python's standard sorting algorithm since version 2.3.
 
 Technique
 Consider an array of n elements which needs to be sorted. In Tim sort, the array is divided into several parts where each of them is called a Run. These Runs are sorted by using insertion sort one by one and then the sorted runs get combined using a combine function. The idea of Tim sort is originated from the fact that, insertion sort works more optimally on the short lists rather than working on the larger lists.
 Complexity    Best Case    Average Case    Worst Case
 Time Complexity    O(n)    O(n log n)    O(n log n)
 Space Complexity            n
 
 Steps :
 Divide the array into the number of blocks known as run.
 Consider size of run either 32 or 64(in the below implementation, size of run is 32.)
 Sort the individual elements of every run one by one using insertion sort.
 Merge the sorted runs one by one using merge function of merge sort.
 Double the size of merged sub-arrays after every iteration.
*/
var arr = [23,4,21,0,23432, 5]
let run : Int = 5


func timSort() {
    print("Unsorted : \(arr)")
    for i in stride(from: 0, to: arr.count, by: run) {
        print("i : \(min((i + run),(arr.count)))")
        arr.replaceSubrange(i..<min((i + run),(arr.count)), with: insertionSort(Array(arr[i..<min((i + run),(arr.count))])))
    }
    print("after insertion sort \(arr)")

    var runCount = run
    while runCount < arr.count{
        for x in stride(from: 0, to: arr.count, by: 2 * runCount) {
            print("x : \(x) runcount \(runCount) calc : \(x + 2 * runCount)")
            arr.replaceSubrange(x..<min(x + 2 * runCount, arr.count), with: merge(leftPile: Array(arr[x..<min(x + runCount, arr.count)]), rightPile: Array(arr[min(x + runCount, arr.count)..<min(x + 2 * runCount, arr.count)])))
        }
        runCount = runCount * 2
    }

    print("Sorted : \(arr)")
}

func insertionSort(_ array:[Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0

    var orderedPile = [Int]()

    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return orderedPile
}
timSort()

//reference: https://stackoverflow.com/questions/51551144/timsort-in-swift
