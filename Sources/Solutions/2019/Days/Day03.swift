import Foundation
import Tools

final class Day03Solver: DaySolver {
	let dayNumber: Int = 3

	struct Input {
		let lines: [[Move]]
	}

	enum Move {
		case up(count: Int)
		case right(count: Int)
		case down(count: Int)
		case left(count: Int)
	}

	// we can cache the intersections for part 2
	private var resultCache: [(point: Point2D, steps: Int)]!

	private func intersections(for lines: [[Move]]) -> [(point: Point2D, steps: Int)] {
		var points: [Point2D: (lineIndex: Int, steps: Int)] = [:]

		var intersections: [(point: Point2D, steps: Int)] = []

		for (lineIndex, line) in lines.enumerated() {
			var point = Point2D(x: 0, y: 0)
			var steps = 0

			for move in line {
				let count: Int
				let direction: Point2D

				switch move {
				case .up(let upCount):
					count = upCount
					direction = Point2D(x: 0, y: -1)
				case .down(let downCount):
					count = downCount
					direction = Point2D(x: 0, y: 1)
				case .right(let rightCount):
					count = rightCount
					direction = Point2D(x: 1, y: 0)
				case .left(let leftCount):
					count = leftCount
					direction = Point2D(x: -1, y: 0)
				}

				for _ in 0 ..< count {
					point = point + direction
					steps += 1

					if let existingPoint = points[point] {
						if existingPoint.lineIndex != lineIndex {
							intersections.append((point: point, steps: existingPoint.steps + steps))
						}
					} else {
						points[point] = (lineIndex: lineIndex, steps: steps)
					}
				}
			}
		}

		return intersections
	}

	func solvePart1(withInput input: Input) -> Int {
		let intersections = intersections(for: input.lines)

		resultCache = intersections

		return intersections.map { abs($0.point.x) + abs($0.point.y) }.min()!
	}

	func solvePart2(withInput input: Input) -> Int {
		resultCache.map(\.steps).min()!
	}

	func parseInput(rawString: String) -> Input {
		let lines: [[Move]] = rawString.allLines().map {
			let line: [Move] = $0.components(separatedBy: ",").map {
				let count = Int($0[1 ..< $0.count])!

				switch $0[0 ... 0] {
				case "U": return .up(count: count)
				case "D": return .down(count: count)
				case "R": return .right(count: count)
				case "L": return .left(count: count)
				default: fatalError()
				}
			}

			return line
		}

		return .init(lines: lines)
	}
}
