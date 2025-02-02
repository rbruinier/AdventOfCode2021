import Foundation
import Tools

var yearSolver = YearSolver(year: 2024)

yearSolver.addSolver(Day01Solver())
yearSolver.addSolver(Day02Solver())
yearSolver.addSolver(Day03Solver())
yearSolver.addSolver(Day04Solver())
yearSolver.addSolver(Day05Solver())
yearSolver.addSolver(Day06Solver())
yearSolver.addSolver(Day07Solver())
yearSolver.addSolver(Day08Solver())
yearSolver.addSolver(Day09Solver())
yearSolver.addSolver(Day10Solver())
yearSolver.addSolver(Day11Solver())
yearSolver.addSolver(Day12Solver())
yearSolver.addSolver(Day13Solver())
yearSolver.addSolver(Day14Solver())
yearSolver.addSolver(Day15Solver())
yearSolver.addSolver(Day16Solver())
yearSolver.addSolver(Day17Solver())
yearSolver.addSolver(Day18Solver())
yearSolver.addSolver(Day19Solver())
yearSolver.addSolver(Day20Solver())
yearSolver.addSolver(Day21Solver())
yearSolver.addSolver(Day22Solver())
yearSolver.addSolver(Day23Solver())
yearSolver.addSolver(Day24Solver())
yearSolver.addSolver(Day25Solver())

await solveYear(yearSolver, dayNumber: 23, bundle: .module)
