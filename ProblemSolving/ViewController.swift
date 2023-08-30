//
//  ViewController.swift
//  ProblemSolving
//
//  Created by Ravneet Arora on 16/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //checking Initial commit
        // Do any additional setup after loading the view.
        // **********Reverse string ****************
        //        var input: [Character] = ["H","a","n","n","a","h"]
        //        reverseString(&input)
        
        // **********Restore IP Address -- backtracking ****************
        //    let output = restoreIpAddresses("19216811")
        
        // ********** fibonnaci -- backtracking ****************
        //        let output = fib(1)
        //        print("output ---> \(output)")
        
        // ********** climb stairs -- backtracking ****************
        //        let output = climbStairs(n: 3)
        //        let output = anotherClimbStairs(3)
        //        print("output ---> \(output)")
        
        
        // ********** Recursion ****************
        //        let output = factorial(number: 3)
        //        print("output -----> \(output)")
        // ********** Move zeroes ****************
        //        var input = [1,0,2]
        //        let output = moveZeroes(&input)
        // ********** check cycle in linked list ****************
//        let node2: ListNode = ListNode(2)
//        let node1: ListNode = ListNode(1)
//        node2.next = node1
//        node1.next = node2
//
//        let output = hasCycle(node1)
//        print("output ----> \(output)")
        // ********** house robber problem ****************
//        let output = rob([1,2,3,1])
//        print("output ----> \(output)")
        // **********  subset ****************
   //     let output = subsets([1,2,3,4])
        
//        // ********** longest substring without repeating characters ****************
//        let output = lengthOfLongestSubstring("dvdf")
        
//        // ********** longest common prefix ****************
//        let output = longestCommonPrefix(["dog","cat","car"])
        
        // ********** Merge intervals ****************
//        let output = merge([[1,4],[4,5]])
        
        // ********** Combination sum ****************
        let output = combinationSum([2,3,5], 8)
    }
    
    func reverseString(_ s: inout [Character]) {
        var temp: Character = " "
        
        for i in 0..<s.count/2 {
            temp = s[i]
            s[i] = s[(s.count-1)-i]
            s[(s.count-1)-i] = temp
        }
        print("after for loop ---> \(s)")
    }
    
    func restoreIpAddresses(_ s: String) -> [String] {
        var s = Array(s)
        var result = [String]()
        func backtracking(_ index: Int, _ count: Int, _ str: String) {
            if count == 3 && index < s.count {
                let value = Int(String(s[index...]))!
                if 0 <= value && value <= 255 {
                    let ans = str + "\(value)"
                    if (s.count + 3) == ans.count {
                        result.append(ans)
                    }
                }
                return
            }
            
            var val = 0
            for i in index ..< s.count {
                val = (val * 10) + Int("\(s[i])")!
                if 0 <= val && val <= 255 {
                    backtracking(i + 1, count + 1, str + "\(val).")
                }
            }
        }
        
        backtracking(0, 0, "")
        return result
    }
    
    func fib(_ n: Int) -> Int {
        var first = 0
        var second = 1
        var sum = 0
        for i in 0..<n {
            if i == 0 {
                first = 0
                second = 0
            } else if i == 1 {
                first = 0
                second = 1
            }
            sum = first + second
            first = second
            second = sum
            
        }
        return sum
    }
    
    func climbStairs(n: Int) -> Int {
        if n < 2 {
            return 1
        } else {
            return climbStairs(n: n-1) + climbStairs(n: n-2)
        }
    }
    
    //using fibonacci
    func anotherClimbStairs(_ n: Int) -> Int {
        if n < 3 { return n }
        var first = 1
        var second = 1
        for _ in 2...n {
            let next = first + second
            first = second
            second = next
        }
        return second
    }
    
    func factorial(number: Int) -> Int {
        print ("number ---> \(number)")
        if number == 0 {
            print ("number is 0 return 1")
            return 1
        } else {
            print ("number is not 0 multiply number and factorial")
            return number * factorial(number: number - 1)
        }
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        var lastNum = 0
        for index in 0..<nums.count {
            if nums[index] != 0 {
                print("before swapping ---> \(nums)")
                nums.swapAt(lastNum, index)
                print("after swapping ---> \(nums)")
                lastNum += 1
            }
        }
        print("final output ----> \(nums)")
    }
    
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     public var val: Int
     *     public var next: ListNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.next = nil
     *     }
     * }
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        var slowPointer = head
        var fastPointer = head
        
        while slowPointer != nil {
            slowPointer = head?.next
            fastPointer = head?.next?.next
            if fastPointer != nil && slowPointer === fastPointer {
                return true
            }
        }
        return false
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slowRunner = head
        var fastRunner = head
        //Move fast runner to nth position from beginning
        for i in 0..<n {
            if fastRunner?.next == nil {
                if i == (n-1) {
                    slowRunner = head?.next
                    return slowRunner
                }
            }
            fastRunner = fastRunner?.next
        }
        //Move both slow and fast runners by 1
        while fastRunner?.next != nil {
            slowRunner = slowRunner?.next
            fastRunner = fastRunner?.next
        }
        //now fast runner points to tail, slow runner points to nth position from end. Now we can remove it
        slowRunner?.next = slowRunner?.next?.next
        return head
    }
    func rob(_ nums: [Int]) -> Int {
           var rob1 = 0
           var rob2 = 0
           
           for i in nums {
               let temp = max(i + rob1, rob2)
               rob1 = rob2
               rob2 = temp
               print("rob2 ---> \(rob2)")
           }
           return rob2
       }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
          var result = [[Int]]()
          var currIndex = 0

          result.append([])

          for i in nums {
              while currIndex < result.count {
                  var subset = result[currIndex]

                  if subset == [i] { // All of i subsets already in result
                      currIndex = 0
                      break
                  }

                  subset.append(i)
                  print("result before adding subset ---> \(result)")
                  result.append(subset)
                  print("result after adding subset ---> \(result)")
                  currIndex += 1
              }
              print("result ---> \(result)")
          }

          return result
      }
    
    func lengthOfLongestSubstring(_ string: String) -> Int {

          let characters = string.map { $0 }
          var charsSet = Set<Character>()
          var result = 0
          var leftPointerIndex = 0

          for (rightPointerIndex, character) in characters.enumerated() {

              while charsSet.contains(character) {
                  charsSet.remove(characters[leftPointerIndex])
                  leftPointerIndex += 1
              }
              charsSet.insert(character)
              result = max(result, rightPointerIndex - leftPointerIndex + 1)
          }

          return result
      }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
            
            if strs.isEmpty { return "" }
            var common = strs[0]
            
            for ch in strs {
                while !ch.hasPrefix(common) {
                    common = String(common.dropLast())
                }
            }
            return common
        }
    
//    func merge(_ intervals: [[Int]]) -> [[Int]] {
//
//           let sorted = intervals.sorted(by: {$0[0] < $1[0]})
//           guard let first = sorted.first else { return [[Int]]() }
//
//           var merged = [first]
//
//           for current in sorted {
//               guard let last = merged.last else { continue }
//
//               let prev = last[0]
//               let penult = last[1]
//
//               let start = current[0], end = current[1]
//
//               if penult >= start {
//                   merged[merged.count - 1] = [prev, max(penult, end)]
//               } else {
//                   merged.append(current)
//               }
//           }
//           return merged
//       }
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
           let sortedIntervals = intervals.sorted {$0[0] < $1[0]}
           var merged: [[Int]] = [sortedIntervals[0]]
           
           for i in 0..<sortedIntervals.count {
               guard let last = merged.last else {
                   continue
               }
               
               let current = sortedIntervals[i]
             
               if last[1] >= current[0] {
                   merged[merged.count - 1] = [last[0], max(sortedIntervals[i][1], last[1])]
               } else {
                   merged.append(sortedIntervals[i])
               }
           }
           return merged
       }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
           var ans = [[Int]]()
           var comb = [Int]()
           
           backtrack(remain: target, comb: &comb, start: 0, candidates: candidates, ans: &ans)
           return ans
       }


       private func backtrack(remain: Int, comb: inout [Int], start: Int, candidates: [Int], ans: inout [[Int]]) {
           print("remain -----> \(remain)")
           print("comb -----> \(comb)")
           print("start -----> \(start)")
           print("candidates -----> \(candidates)")
           print("ans -----> \(ans)")
           
           guard remain >= 0 else {
               return
               
           }
           guard remain != 0 else {
               ans.append(comb)
               return
           }

           for i in start..<candidates.count {
               comb.append(candidates[i])
               backtrack(remain: remain - candidates[i], comb: &comb, start: i, candidates: candidates, ans: &ans)
               comb.removeLast()
           }
       }

}

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }
