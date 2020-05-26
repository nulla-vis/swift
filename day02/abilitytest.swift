//task1
print("実力テスト１")
fizzbuzz(number:20)

//task2
print("実力テスト2")
letterCount(string:"xxzaffeeeeddfkkkkllq")


//task3
print("実力テスト3")
numberChange(int:11001100)

//funtions
func fizzbuzz(number:Int) {
   var num = 1
   while num <= number {
        if (num % 3 == 0) && (num % 5 == 0) {
            print("FizzBuzz")
        }else if num%3 == 0 {
            print("Fizz")
        }else if num%5 == 0 {
            print("buzz")
        }else {
            print(num)
        }
    num += 1
   }
   print("")
}

func letterCount (string: String) {
    var countS = 1
    for a in 1...string.count-1{
        let s = index(str:string,a:a)
        let stringA = s.strA
        let stringB = s.strB
        if stringA != stringB {
            countS += 1
        }
    }
     print(countS,"\n")
}

func numberChange(int:Int) {
    let string = int.description
    var numChange = ""
    var counter = 1
    numChange += String(string[string.startIndex])
    for i in 1...string.count-1 {
        let s = index(str:string,a:i)
        let strA = s.strA
        let strB = s.strB
        if strA == strB {
            counter += 1
        }else{
            numChange += counter.description
            numChange += String(strA)
            counter = 1
        }
    }
    numChange += counter.description
    print(numChange)
}

func index(str:String,a:Int)->(strA : Character, strB : Character) {
        let indexA = str.index(str.startIndex, offsetBy: a)
        let indexB = str.index(str.startIndex, offsetBy: a-1)
        let strA = str[indexA]
        let strB = str[indexB]
        return (strA,strB)
}
