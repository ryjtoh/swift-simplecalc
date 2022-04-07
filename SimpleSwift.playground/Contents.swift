print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    let length = args.count
    // Error Checking
    if (length == 1) {
        return 0
    }
    let lastElement : String = args[length - 1]
    var res = 0
    
    if (lastElement == "count") {          // COUNT
        return length - 1
    }
    else if (lastElement == "avg") {       // AVERAGE
        for index in 0...(length - 2) {
            res += Int(args[index])!
        }
        return res / (length - 1)
    }
    else if (lastElement == "fact") {      // FACTORIAL
        let factorialNum = Int(args[0])!
        if (factorialNum == 0) {
            return 1
        } else {
            res = 1
            for num in 1...factorialNum {
                res *= num
            }
            return res
        }
    }
    else {                                 // SIMPLE ARITHMETIC
        let num1 = Int(args[0])!
        let num2 = Int(args[2])!

        let op = args[1]
        
        if (op == "+") {
            return num1 + num2
        }
        else if (op == "-") {
            return num1 - num2
        }
        else if (op == "*") {
            return num1 * num2
        }
        else if (op == "/") {
            return num1 / num2
        }
        else if (op == "%") {
            return num1 % num2
        }
    }
    return -1
}

func calculate(_ arg: String) -> Int {
    let substringArray = arg.split(separator: " ")
    var stringArray : [String] = []
    for index in 0...(substringArray.count - 1) {
        stringArray.append(String(substringArray[index]))
    }
    return calculate(stringArray)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    let length = args.count
    // Error Checking
    if (length == 1) {
        return 0.0
    }
    let lastElement : String = args[length - 1]
    var res = 0.0
    
    if (lastElement == "count") {          // COUNT
        return Double(length) - 1.0
    }
    else if (lastElement == "avg") {       // AVERAGE
        for index in 0...(length - 2) {
            res += Double(args[index])!
        }
        return res / (Double(length - 1))
    }
    else if (lastElement == "fact") {      // FACTORIAL
        let factorialNum = Int(args[0])!
        if (factorialNum == 0) {
            return 1.0
        } else {
            res = 1.0
            for num in 1...factorialNum {
                res *= Double(num)
            }
            return res
        }
    }
    else {                                 // SIMPLE ARITHMETIC
        let num1 = Double(args[0])!
        let num2 = Double(args[2])!

        let op = args[1]
        
        if (op == "+") {
            return num1 + num2
        }
        else if (op == "-") {
            return num1 - num2
        }
        else if (op == "*") {
            return num1 * num2
        }
        else if (op == "/") {
            return num1 / num2
        }
        else if (op == "%") {
            return num1.truncatingRemainder(dividingBy: num2)
        }
    }
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5

