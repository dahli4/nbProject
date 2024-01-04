import UIKit

class AddOperation {
    func operate(num1: Int, num2: Int) -> Double {
        return Double(num1 + num2)
    }
}

class SubtractOperation {
    func operate(num1: Int, num2: Int) -> Double {
        return Double(num1 - num2)
    }
}

class MultiplyOperation {
    func operate(num1: Int, num2: Int) -> Double {
        return Double(num1 * num2)
    }
}

class DivideOperation {
    func operate(num1: Int, num2: Int) -> Double {
        return Double(num1 / num2)
    }
}

class Calculator {
    private let addOperation: AddOperation
    private let subOperation: SubtractOperation
    private let mulOperation: MultiplyOperation
    private let divOperation: DivideOperation

    init(addOperation: AddOperation,
         subOperation: SubtractOperation,
         mulOperation: MultiplyOperation,
         divOperation: DivideOperation) {
        self.addOperation = addOperation
        self.subOperation = subOperation
        self.mulOperation = mulOperation
        self.divOperation = divOperation
    }

    func calculate(operator: String, num1: Int, num2: Int) -> Double? {
        if `operator` == "+" {
            return addOperation.operate(num1: num1, num2: num2)
        }
        if `operator` == "-" {
            return subOperation.operate(num1: num1, num2: num2)
        }
        if `operator` == "*" {
            return mulOperation.operate(num1: num1, num2: num2)
        }
        if `operator` == "/" {
            return divOperation.operate(num1: num1, num2: num2)
        }
        return nil
    }
}

let calculator = Calculator(
    addOperation: AddOperation(),
    subOperation: SubtractOperation(),
    mulOperation: MultiplyOperation(),
    divOperation: DivideOperation()
)

let addResult = calculator.calculate(operator: "+", num1: 10, num2: 20) ?? 0
let subResult = calculator.calculate(operator: "-", num1: 49, num2: 29) ?? 0
let mulResult = calculator.calculate(operator: "*", num1: 20, num2: 10) ?? 0
let divResult = calculator.calculate(operator: "/", num1: 10, num2: 2) ?? 0

print("Addition Result: \(addResult)")
print("Subtraction Result: \(subResult)")
print("Multiplication Result: \(mulResult)")
print("Division Result: \(divResult)")
