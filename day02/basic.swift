var str = "Hello playground"
var name: String = "Azhandi Usemahu"
str = "Hello, world!"

let courseName = "iOS app Develop"

var word: String? = nil
word = "OK"
print(word!)
// UpperCamelCase
// lowerCamelCase 定数もこっち

//関数の処理の失敗 = nil
var num: Int? = Optional(1)
// print(num)

//条件分岐とスコープScope======================================
let days = 2
if days <= 3 {
    print("クーポンが後\(days)日で切れます")   
}

// print("クーポンが後" + String(days) + "日で切れます")
var optionalNum = Optional(1)
optionalNum = nil
if let num = optionalNum {
    print(num)
} else {
    print("値がありません")
}
// print(optionalNum!)

let age = 5
if case 1..<6 = age {  //between
    print(age)
    print("幼児料金です")
    // let n = "???"
}


//loop & array======================================
// var nums = [1,2,3,4]
// other way to declare
var nums: [Int] = [1,2,3,4]
//index付きのforは無くなった
for num in nums {
    print(num)
}

// let dict = ["a":1,"b":2]
let dict:[String:Int] = ["a":1,"b":2]
for(key,value) in dict {
    print("key:\(key), value:\(value)")
}

for case 2...3 in nums {
    print("2以上3以下")
}

var i = 1
while i<4 {
    print(i)
    i += 1
}

var j = 1
repeat {
    print(j)
    j+=1
} while j<4

//break continue also there!
nums[1]=9 //becarefull for let (constant) and var (dynamic)
print(nums[1])
print(dict["b"]!)
