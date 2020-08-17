import XCTest
@testable import Math

final class MatrixTest: XCTestCase {
    var v: Vector = Vector(values: [])
    var V: Vector = Vector(values: [])
    var vr: Vector = Vector(values: [])
    var small: Matrix = Matrix(size: 0)
    var medium: Matrix = Matrix(size: 0)
    var large: Matrix = Matrix(size: 0)
    var random: Matrix = Matrix(size: 0)
    var identity: Matrix = Matrix(size: 0)
    var originalSum: Double = 0.0

    override func setUp(){
        self.small = Matrix(row: 3, col: 3)
        for i in 0..<3{
            for j in 0..<3{
                self.small.setValue(rowNo: i, colNo: j, value: 1.0)
            }
        }
        self.v = Vector(size: 3, x: 1.0)
        self.large = Matrix(row: 1000, col: 1000)
        for i in 0..<1000{
            for j in 0..<1000{
                self.large.setValue(rowNo: i, colNo: j, value: 1.0)
            }
        }
        self.medium = Matrix(row: 100, col: 100)
        for i in 0..<100{
            for j in 0..<100{
                self.medium.setValue(rowNo: i, colNo: j, value: 1.0)
            }
        }
        self.V = Vector(size: 1000, x: 1.0)
        self.vr = Vector(size: 100, x: 1.0)
        self.random = Matrix(row: 100, col: 100, min: 1, max: 10)
        self.originalSum = self.random.sumOfElements()
        self.identity = Matrix(size: 100)
    }
    
    func testColumnWiseNormalize(){
        let mClone : Matrix = self.small.copy() as! Matrix
        mClone.columnWiseNormalize()
        XCTAssertEqual(3, mClone.sumOfElements())
        let MClone : Matrix = self.large.copy() as! Matrix
        MClone.columnWiseNormalize()
        XCTAssertEqual(1000, MClone.sumOfElements(), accuracy: 0.001)
        self.identity.columnWiseNormalize()
        XCTAssertEqual(100, self.identity.sumOfElements())
    }

    func testMultiplyWithConstant(){
        self.small.multiplyWithConstant(constant: 4)
        XCTAssertEqual(36, self.small.sumOfElements())
        self.small.divideByConstant(constant: 4)
        self.large.multiplyWithConstant(constant: 1.001)
        XCTAssertEqual(1001000, self.large.sumOfElements(), accuracy: 0.001)
        self.large.divideByConstant(constant: 1.001)
        self.random.multiplyWithConstant(constant: 3.6)
        XCTAssertEqual(self.originalSum * 3.6, self.random.sumOfElements(), accuracy: 0.0001)
        self.random.divideByConstant(constant: 3.6)
    }

    func testDivideByConstant(){
        self.small.divideByConstant(constant: 4)
        XCTAssertEqual(2.25, self.small.sumOfElements())
        self.small.multiplyWithConstant(constant: 4)
        self.large.divideByConstant(constant: 10)
        XCTAssertEqual(100000, self.large.sumOfElements(), accuracy: 0.001)
        self.large.multiplyWithConstant(constant: 10)
        self.random.divideByConstant(constant: 3.6)
        XCTAssertEqual(self.originalSum / 3.6, self.random.sumOfElements(), accuracy: 0.0001)
        self.random.multiplyWithConstant(constant: 3.6)
    }

    func testAdd(){
        self.random.add(m: self.identity)
        XCTAssertEqual(self.originalSum + 100, self.random.sumOfElements(), accuracy: 0.0001)
        self.random.subtract(m: self.identity)
    }

    func testAddVector(){
        self.large.addRowVector(rowNo: 4, v: self.V)
        XCTAssertEqual(1001000, self.large.sumOfElements())
        self.V.multiply(value: -1.0)
        self.large.addRowVector(rowNo: 4, v: self.V)
        self.V.multiply(value: -1.0)
    }

    func testSubtract(){
        self.random.subtract(m: self.identity)
        XCTAssertEqual(self.originalSum - 100, self.random.sumOfElements(), accuracy: 0.0001)
        self.random.add(m: self.identity)
    }

    func testMultiplyWithVectorFromLeft(){
        var result : Vector = self.small.multiplyWithVectorFromLeft(v: self.v)
        XCTAssertEqual(9, result.sumOfElements())
        result = self.large.multiplyWithVectorFromLeft(v: self.V)
        XCTAssertEqual(1000000, result.sumOfElements())
        result = self.random.multiplyWithVectorFromLeft(v: self.vr)
        XCTAssertEqual(self.originalSum, result.sumOfElements(), accuracy: 0.0001)
    }

    func testMultiplyWithVectorFromRight(){
        var result : Vector = self.small.multiplyWithVectorFromRight(v: self.v)
        XCTAssertEqual(9, result.sumOfElements())
        result = self.large.multiplyWithVectorFromRight(v: self.V)
        XCTAssertEqual(1000000, result.sumOfElements())
        result = self.random.multiplyWithVectorFromRight(v: self.vr)
        XCTAssertEqual(self.originalSum, result.sumOfElements(), accuracy: 0.0001)
    }

    func testColumnSum(){
        XCTAssertEqual(3, self.small.columnSum(columnNo: Int.random(in: 0..<3)))
        XCTAssertEqual(1000, self.large.columnSum(columnNo: Int.random(in: 0..<1000)))
        XCTAssertEqual(1, self.identity.columnSum(columnNo: Int.random(in: 0..<100)))
    }

    func testSumOfRows(){
        XCTAssertEqual(9, self.small.sumOfRows().sumOfElements())
        XCTAssertEqual(1000000, self.large.sumOfRows().sumOfElements())
        XCTAssertEqual(100, self.identity.sumOfRows().sumOfElements())
        XCTAssertEqual(self.originalSum, self.random.sumOfRows().sumOfElements(), accuracy: 0.001)
    }

    func testRowSum(){
        XCTAssertEqual(3, self.small.rowSum(rowNo: Int.random(in: 0..<3)))
        XCTAssertEqual(1000, self.large.rowSum(rowNo: Int.random(in: 0..<1000)))
        XCTAssertEqual(1, self.identity.rowSum(rowNo: Int.random(in: 0..<100)))
    }

    func testMultiply(){
        var result : Matrix = self.small.multiply(m: self.small)
        XCTAssertEqual(27, result.sumOfElements())
        result = self.medium.multiply(m: self.medium)
        XCTAssertEqual(1000000.0, result.sumOfElements())
        result = self.random.multiply(m: self.identity)
        XCTAssertEqual(self.originalSum, result.sumOfElements())
        result = self.identity.multiply(m: self.random)
        XCTAssertEqual(self.originalSum, result.sumOfElements())
    }

    func testElementProduct(){
        var result : Matrix = self.small.elementProduct(m: self.small)
        XCTAssertEqual(9, result.sumOfElements())
        result = self.large.elementProduct(m: self.large)
        XCTAssertEqual(1000000, result.sumOfElements())
        result = self.random.elementProduct(m: self.identity)
        XCTAssertEqual(result.trace(), result.sumOfElements())
    }

    func testSumOfElements(){
        XCTAssertEqual(9, self.small.sumOfElements())
        XCTAssertEqual(1000000, self.large.sumOfElements())
        XCTAssertEqual(100, self.identity.sumOfElements())
        XCTAssertEqual(self.originalSum, self.random.sumOfElements())
    }

    func testTrace(){
        XCTAssertEqual(3, self.small.trace())
        XCTAssertEqual(1000, self.large.trace())
        XCTAssertEqual(100, self.identity.trace())
    }

    func testTranspose(){
        XCTAssertEqual(9, self.small.transpose().sumOfElements())
        XCTAssertEqual(1000000, self.large.transpose().sumOfElements())
        XCTAssertEqual(100, self.identity.transpose().sumOfElements())
        XCTAssertEqual(self.originalSum, self.random.transpose().sumOfElements(), accuracy: 0.001)
    }

    func testIsSymmetric(){
        XCTAssertTrue(self.small.isSymmetric())
        XCTAssertTrue(self.large.isSymmetric())
        XCTAssertTrue(self.identity.isSymmetric())
        XCTAssertFalse(self.random.isSymmetric())
    }

    func testDeterminant(){
        XCTAssertEqual(0, self.small.determinant())
        XCTAssertEqual(0, self.large.determinant())
        XCTAssertEqual(1, self.identity.determinant())
    }

    func testInverse(){
        self.identity.inverse()
        XCTAssertEqual(100, self.identity.sumOfElements())
        self.random.inverse()
        self.random.inverse()
        XCTAssertEqual(self.originalSum, self.random.sumOfElements(), accuracy: 0.00001)
    }

    func testCharacteristics(){
        var vectors : [Eigenvector] = self.small.characteristics()
        XCTAssertEqual(2, vectors.count)
        vectors = self.identity.characteristics()
        XCTAssertEqual(100, vectors.count)
        vectors = self.medium.characteristics()
        XCTAssertEqual(46, vectors.count)
    }
    
    static var allTests = [
        ("testExample1", testColumnWiseNormalize),
        ("testExample2", testMultiplyWithConstant),
        ("testExample3", testDivideByConstant),
        ("testExample4", testAdd),
        ("testExample5", testAddVector),
        ("testExample6", testSubtract),
        ("testExample7", testMultiplyWithVectorFromLeft),
        ("testExample8", testMultiplyWithVectorFromRight),
        ("testExample9", testColumnSum),
        ("testExample10", testSumOfRows),
        ("testExample11", testRowSum),
        ("testExample12", testMultiply),
        ("testExample13", testElementProduct),
        ("testExample14", testSumOfElements),
        ("testExample15", testTrace),
        ("testExample16", testTranspose),
        ("testExample17", testIsSymmetric),
        ("testExample18", testDeterminant),
        ("testExample19", testInverse),
        ("testExample20", testCharacteristics),
    ]
}
