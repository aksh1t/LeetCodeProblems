public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public var description: String {
        if (next == nil) {
            return "\(val) -> nil"
        }
        return "\(val) -> \(String(describing: next!.description))"
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1 = l1
        var n2 = l2
        var carry = 0
        var answerList : [Int] = []
        while n1 != nil || n2 != nil {
            let sum = ((n1?.val) ?? 0) + ((n2?.val) ?? 0) + carry
            answerList.append(sum%10)
            carry = sum/10
            n1 = n1?.next
            n2 = n2?.next
        }
        if (carry > 0) { answerList.append(carry) }
        let firstNode = ListNode(answerList[0])
        var answerNode = firstNode
        for i in 1..<answerList.count {
            let tempNode = ListNode(answerList[i])
            answerNode.next = tempNode
            answerNode = tempNode
        }
        return firstNode
    }
}

/*
You are given two non-empty linked lists representing two non-negative integers.
The digits are stored in reverse order and each of their nodes contain a single
digit. Add the two numbers and return it as a linked list. You may assume the
two numbers do not contain any leading zero, except the number 0 itself.

Example:
Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
 */

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

print(Solution().addTwoNumbers(l1, l2)!)

