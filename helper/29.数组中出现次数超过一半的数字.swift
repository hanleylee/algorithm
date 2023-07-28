//: Playground - noun: a place where people can play

/*
 我们考虑阵地攻守（镇守阵地），遇见一个友军就抱成团，遇见一个敌军就同归于尽，那么最后战场上剩余的肯定就是人数（出现次数）最多的那个队伍（数字）

 采用阵地攻守的思想

 第一个数字作为第一个士兵，守阵地；count = 1；

 遇到相同元素，count++; 遇到不相同元素，即为敌人，同归于尽,count--；

 当遇到count为0的情况，又以新的i值作为守阵地的士兵，继续下去，到最后还留在阵地上的士兵，有可能是主元素。

 再加一次循环，记录这个士兵的个数看是否大于数组一般即可。

 由于我们要找的数字出现的次数比他所有数字出现的次数之和还要多，那么要找的数字肯定是最后一次把次数设为1时对应的数字，因为少的元素都已经阵亡了，战场上仅剩下的一定是人数数目要多的那个队伍
 */

func moreThanHalf(in nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    } else if nums.count == 1 {
        return nums[0]
    }

    var result = nums[0] // 守阵地
    var count = 1 // 计数

    for i in 1 ..< nums.count {
        if nums[i] == result { // 抱团
            count += 1
        } else { // 同归
            count -= 1
        }

        if count == 0 { // 全挂，重置
            result = nums[i]
            count = 1
        }
    }

    // 统计验证
    count = 0
    for num in nums {
        if result == num {
            count += 1
        }
    }

    // 返回
    if Double(count) > Double(nums.count) * 0.5 {
        return result
    } else {
        return 0
    }
}

let a = [1, 2, 3, 2, 2, 2, 5, 4, 2]
let b = [2, 2, 2, 2, 2, 1, 3, 4, 5]
let c = [1, 3, 4, 5, 2, 2, 2, 2, 2]
let d = [1, 1, 2]

moreThanHalf(in: a)
moreThanHalf(in: b)
moreThanHalf(in: c)
moreThanHalf(in: d)
