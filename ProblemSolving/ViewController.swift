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
        
//        // ********** Combination sum ****************
//        let output = combinationSum([2,3,5], 8)
        // ------------- 3 Sum --------------
//        let output = threeSum([-1,0,1,2,-1,-4])
//        let output = threeSum([1,2,3,4])
//        print("output ----> \(output)")
        // --------search insertion point -----
//        let output = searchInsert([1,3,5,6], 4)
//        print("output ---> \(output)")
        
        // --------- climb stairs -----------
//        let output = anotherClimbStairs(3)
//        print("output ----> \(output)")
        
        // --------- word break -----------
//        let output = wordBreak("leetcode", ["leet", "code"])
//        let output = wordBreak("leetcode", ["leet", "leetcode"])
//        print("output ----> \(output)")
        // --------- jump game -----------
//        let output = canJump([2,3,1,1,4])
//        print("output ----> \(output)")
        
        // --------- minimum jumps -----------
//        let output = minimumJumps([2,3,1,1,4])
//        print("output ----> \(output)")
//
        // // --------- bubble sort -----------
//        var input = [2,5,7,3,4]
//        bubbleSort(&input)
        
        // --------- merge sort --------
        var input = [2,5,7,3,4]
        let output = mergeSort(inputArray: input)
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
    //not optimized
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//
//          if nums.count == 3 {
//              if nums[0] + nums[1] + nums[2] == 0 {
//                  return [nums]
//              } else {
//                  return []
//              }
//          }
//          var output = Set<[Int]>()
//          for i in 0...(nums.count - 3) {
//              for j in (i+1)..<nums.count {
//                   var k = nums.count - 1
//                  while j < k {
//
//                  if nums[i] + nums[j] + nums[k] == 0 {
//                      output.insert([nums[i], nums[j], nums[k]].sorted())
//                  }
//                  k -= 1
//                  }
//              }
//          }
//          return Array(output)
//      }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
          var result = Set<[Int]>()

          for i in 0 ..< sortedNums.count {
              var j = i + 1
              var k = sortedNums.count - 1
              while j < k {
                  print("checking ---> [\(sortedNums[i]),\(sortedNums[j]),\(sortedNums[k])]")
                  let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
                  if sum == 0 {
                      result.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                      j += 1
                      k -= 1
                  } else if sum < 0 {
                      j += 1
                  } else {
                      k -= 1
                  }
              }
          }

          return Array(result)
      }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            var start = 0
            var end = nums.count

            while start < end {
                let mid = (start + end) / 2

                if nums[mid] < target {
                    start = mid + 1
                } else {
                    end = mid
                }
            }
            return start
        }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
            var dp = [Bool](repeating: false, count: s.count+1)
            dp[0] = true

            let chars = Array(s)
            let wordSet = Set(wordDict)

            for i in 1...s.count {
//             print("next iteration of outer loop for i ----> \(i)")
                for j in 0..<i {
            //        print("next iteration of inner loop for i ---> \(i) and j ----> \(j)")
            //        print("dp[j] ----> \(dp[j])")
                    print("check string in wordsert ----> \(String(chars[j..<i]))")
                    guard dp[j], wordSet.contains(String(chars[j..<i])) else { continue }
                    print("word found")
            //        print("set dp[i] = true ---> where i ---> \(i) and dp[i] ---> \(dp[i])")
                    dp[i] = true
                    break
                }
            }

            return dp[s.count]
        }
    
    func canJump(_ nums: [Int]) -> Bool {
          var reach = 0
          var i = 0

          while i <= reach {
              print("nums[i] ----> \(nums[i])")
              print("before setting reach ----> \(reach)")
              reach = max(reach, i + nums[i])
              print("After  setting reach ----> \(reach)")
              i += 1
              if reach >= nums.count - 1 { return true }
          }

          return false
      }
    func minimumJumps(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var maxReach: Int = nums[0]
        var steps: Int = nums[0]
        var jumps: Int = 0
        for i in 0..<nums.count {
            maxReach = max(maxReach, nums[i]+i)
            steps -= 1
            if steps == 0 {
                jumps += 1
                steps = maxReach - i
            }
        }
        return jumps+1
    }
    
//    int maxReach = nums[0];
//    int steps = nums[0];
//    int jumps = 0;
//    for(int i=1;i<nums.size()-1;i++)
//    {
//        maxReach = max(maxReach, nums[i]+i);
//        steps--;
//        if(steps==0)
//        {
//            jumps++;
//            steps = maxReach - i;
//        }
//    }
//    return jumps+1
    
    public func bubbleSort<Element>(_ array: inout [Element])
        where Element: Comparable {
    // 1
      guard array.count >= 2 else {
    return
    }
    // 2
      for end in (1..<array.count).reversed() {
        var swapped = false
        // 3
        for current in 0..<end {
          if array[current] > array[current + 1] {
            array.swapAt(current, current + 1)
            swapped = true
          }
    }
    // 4
    if !swapped {
        print("sorted array ---> \(array)")
    return
    } }
    }
    
    func mergeSort(inputArray: [Int]) -> [Int] {
        print(" inputArray ----> \(inputArray)")
        guard inputArray.count > 1 else {
            print("return in guard statement")
           return inputArray
        }
        //first we split array to two halves until we can not split more
        let middle = inputArray.count / 2
        let left = mergeSort(inputArray: Array(inputArray[..<middle]))
        let right = mergeSort(inputArray: Array(inputArray[middle...]))
        
        return merge(left: left, right: right)
    }

    func merge(left: [Int], right: [Int]) -> [Int] {
        print("left ---> \(left)")
        print("right ---> \(right)")
    
        // 1
        var leftIndex = 0
        var rightIndex = 0
        // 2
        var result: [Int] = []
        // 3
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            // 4
            if leftElement < rightElement {
                result.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                result.append(rightElement)
                rightIndex += 1
            } else {
                result.append(leftElement)
                leftIndex += 1
                result.append(rightElement)
                rightIndex += 1
            } }
        // 5
        if leftIndex < left.count {
            result.append(contentsOf: left[leftIndex...])
        }
        if rightIndex < right.count {
            result.append(contentsOf: right[rightIndex...])
        }
        print("result ---> \(result)")
        return result
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
