import Foundation

public struct Input {
    let drawnNumbers: [Int]
    let boards: [Board]
}

public struct Board {
    struct Item {
        var value: Int
        var checked: Bool = false
    }

    var items: [Item]

    init(numbers: [Int]) {
        items = numbers.map {
            .init(value: $0)
        }
    }

    var isCompleted: Bool {
        for row in 0 ..< 5 {
            if items[row * 5 ..< ((row + 1) * 5)].allSatisfy({ $0.checked == true }) {
                return true
            }
        }

        for column in 0 ..< 5 {
            var checkedCount = 0

            for row in 0 ..< 5 {
                checkedCount += items[(row * 5) + column].checked ? 1 : 0
            }

            if checkedCount == 5 {
                return true
            }
        }

        return false
    }

    mutating func mark(number: Int) {
        for index in 0 ..< 25 {
            if items[index].value == number {
                items[index].checked = true

                return
            }
        }
    }

    var score: Int {
        return items.reduce(0) { result, item in
            return result + (item.checked ? 0 : item.value)
        }
    }
}

public func solutionFor(input: Input) -> Int {
    var boards = input.boards

    for number in input.drawnNumbers {
        for boardIndex in 0 ..< boards.count {
            boards[boardIndex].mark(number: number)
        }

        if let completedBoard = boards.first(where: { $0.isCompleted }) {
            return number * completedBoard.score
        }
    }

    return 0
}
