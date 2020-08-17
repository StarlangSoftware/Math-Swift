import XCTest
@testable import Math

final class VectorTest: XCTestCase {
    var smallVector1: Vector = Vector(values: [])
    var smallVector2: Vector = Vector(values: [])
    var largeVector1: Vector = Vector(values: [])
    var largeVector2: Vector = Vector(values: [])
    var data1 : [Double] = [2, 3, 4, 5, 6]

    override func setUp(){
        let data2: [Double] = [8, 7, 6, 5, 4]
        self.smallVector1 = Vector(values: self.data1)
        self.smallVector2 = Vector(values: data2)
        var largeData1 : [Double] = []
        for i in 1..<1001{
            largeData1.append(Double(i))
        }
        self.largeVector1 = Vector(values: largeData1)
        var largeData2 : [Double] = []
        for i in 1..<1001{
            largeData2.append(Double(1000 - i + 1))
        }
        self.largeVector2 = Vector(values: largeData2)
    }

    func testBiased(){
        let biased : Vector = self.smallVector1.biased()
        XCTAssertEqual(1, biased.getValue(index: 0))
        XCTAssertEqual(self.smallVector1.size() + 1, biased.size())
    }

    func testElementAdd(){
        self.smallVector1.add(x: 7)
        XCTAssertEqual(7, self.smallVector1.getValue(index: 5))
        XCTAssertEqual(6, self.smallVector1.size())
        self.smallVector1.remove(pos: 5)
    }

    func testInsert(){
        self.smallVector1.insert(pos: 3, x: 6)
        XCTAssertEqual(6, self.smallVector1.getValue(index: 3))
        XCTAssertEqual(6, self.smallVector1.size())
        self.smallVector1.remove(pos: 3)
    }

    func testRemove(){
        self.smallVector1.remove(pos: 2)
        XCTAssertEqual(5, self.smallVector1.getValue(index: 2))
        XCTAssertEqual(4, self.smallVector1.size())
        self.smallVector1.insert(pos: 2, x: 4)
    }

    func testSumOfElementsSmall(){
        XCTAssertEqual(20, self.smallVector1.sumOfElements())
        XCTAssertEqual(30, self.smallVector2.sumOfElements())
    }

    func testSumOfElementsLarge(){
        XCTAssertEqual(20, self.smallVector1.sumOfElements())
        XCTAssertEqual(30, self.smallVector2.sumOfElements())
        XCTAssertEqual(500500, self.largeVector1.sumOfElements())
        XCTAssertEqual(500500, self.largeVector2.sumOfElements())
    }

    func testMaxIndex(){
        XCTAssertEqual(4, self.smallVector1.maxIndex())
        XCTAssertEqual(0, self.smallVector2.maxIndex())
    }

    func testSigmoid(){
        let smallVector3 : Vector = Vector(values: self.data1)
        smallVector3.sigmoid()
        XCTAssertEqual(0.8807971, smallVector3.getValue(index: 0), accuracy: 0.000001)
        XCTAssertEqual(0.9975274, smallVector3.getValue(index: 4), accuracy: 0.000001)
    }

    func testSkipVectorSmall(){
        var smallVector3 : Vector = self.smallVector1.skipVector(mod: 2, value: 0)
        XCTAssertEqual(2, smallVector3.getValue(index: 0))
        XCTAssertEqual(6, smallVector3.getValue(index: 2))
        smallVector3 = self.smallVector1.skipVector(mod: 3, value: 1)
        XCTAssertEqual(3, smallVector3.getValue(index: 0))
        XCTAssertEqual(6, smallVector3.getValue(index: 1))
    }

    func testSkipVectorLarge(){
        var largeVector3 : Vector = self.largeVector1.skipVector(mod: 2, value: 0)
        XCTAssertEqual(250000, largeVector3.sumOfElements())
        largeVector3 = self.largeVector1.skipVector(mod: 5, value: 3)
        XCTAssertEqual(100300, largeVector3.sumOfElements())
    }

    func testVectorAddSmall(){
        self.smallVector1.addVector(v: self.smallVector2)
        XCTAssertEqual(50, self.smallVector1.sumOfElements())
        self.smallVector1.subtract(v: self.smallVector2)
    }

    func testVectorAddLarge(){
        self.largeVector1.addVector(v: self.largeVector2)
        XCTAssertEqual(1001000, self.largeVector1.sumOfElements())
        self.largeVector1.subtract(v: self.largeVector2)
    }

    func testSubtractSmall(){
        self.smallVector1.subtract(v: self.smallVector2)
        XCTAssertEqual(-10, self.smallVector1.sumOfElements())
        self.smallVector1.addVector(v: self.smallVector2)
    }

    func testSubtractLarge(){
        self.largeVector1.subtract(v: self.largeVector2)
        XCTAssertEqual(0, self.largeVector1.sumOfElements())
        self.largeVector1.addVector(v: self.largeVector2)
    }

    func testDifferenceSmall(){
        let smallVector3 : Vector = self.smallVector1.difference(v: self.smallVector2)
        XCTAssertEqual(-10, smallVector3.sumOfElements())
    }

    func testDifferenceLarge(){
        let largeVector3 : Vector = self.largeVector1.difference(v: self.largeVector2)
        XCTAssertEqual(0, largeVector3.sumOfElements())
    }

    func testDotProductWithVectorSmall(){
        let dotProduct : Double = self.smallVector1.dotProduct(v: self.smallVector2)
        XCTAssertEqual(110, dotProduct)
    }

    func testDotProductWithVectorLarge(){
        let dotProduct : Double = self.largeVector1.dotProduct(v: self.largeVector2)
        XCTAssertEqual(167167000, dotProduct)
    }

    func testDotProductWithItselfSmall(){
        let dotProduct : Double = self.smallVector1.dotProductWithSelf()
        XCTAssertEqual(90, dotProduct)
    }

    func testDotProductWithItselfLarge(){
        let dotProduct : Double = self.largeVector1.dotProductWithSelf()
        XCTAssertEqual(333833500, dotProduct)
    }

    func testElementProductSmall(){
        let smallVector3 : Vector = self.smallVector1.elementProduct(v: self.smallVector2)
        XCTAssertEqual(110, smallVector3.sumOfElements())
    }

    func testElementProductLarge(){
        let largeVector3 : Vector = self.largeVector1.elementProduct(v: self.largeVector2)
        XCTAssertEqual(167167000, largeVector3.sumOfElements())
    }

    func testDivide(){
        self.smallVector1.divide(value: 10.0)
        XCTAssertEqual(2, self.smallVector1.sumOfElements())
        self.smallVector1.multiply(value: 10.0)
    }

    func testMultiply(){
        self.smallVector1.multiply(value: 10.0)
        XCTAssertEqual(200, self.smallVector1.sumOfElements())
        self.smallVector1.divide(value: 10.0)
    }

    func testProduct(){
        let smallVector3 : Vector = self.smallVector1.product(value: 7.0)
        XCTAssertEqual(140, smallVector3.sumOfElements())
    }

    func testL1NormalizeSmall(){
        self.smallVector1.l1Normalize()
        XCTAssertEqual(1.0, self.smallVector1.sumOfElements())
        self.smallVector1.multiply(value: 20)
    }

    func testL1NormalizeLarge(){
        self.largeVector1.l1Normalize()
        XCTAssertEqual(1.0, self.largeVector1.sumOfElements())
        self.largeVector1.multiply(value: 500500)
    }

    func testL2NormSmall(){
        let norm : Double = self.smallVector1.l2Norm()
        XCTAssertEqual(norm, sqrt(90))
    }

    func testL2NormLarge(){
        let norm : Double = self.largeVector1.l2Norm()
        XCTAssertEqual(norm, sqrt(333833500))
    }

    func testcosineSimilaritySmall(){
        let similarity : Double = self.smallVector1.cosineSimilarity(v: self.smallVector2)
        XCTAssertEqual(0.8411910, similarity, accuracy: 0.000001)
    }

    func testcosineSimilarityLarge(){
        let similarity : Double = self.largeVector1.cosineSimilarity(v: self.largeVector2)
        XCTAssertEqual(0.5007497, similarity, accuracy: 0.000001)
    }
    
    static var allTests = [
        ("testExample1", testBiased),
        ("testExample2", testElementAdd),
        ("testExample3", testInsert),
        ("testExample4", testRemove),
        ("testExample5", testSumOfElementsSmall),
        ("testExample6", testSumOfElementsLarge),
        ("testExample7", testDifferenceSmall),
        ("testExample8", testDifferenceLarge),
        ("testExample9", testSkipVectorSmall),
        ("testExample10", testSkipVectorLarge),
        ("testExample11", testVectorAddSmall),
        ("testExample12", testVectorAddLarge),
        ("testExample13", testSubtractSmall),
        ("testExample14", testSubtractLarge),
        ("testExample15", testDifferenceSmall),
        ("testExample16", testDifferenceLarge),
        ("testExample17", testDotProductWithVectorSmall),
        ("testExample18", testDotProductWithVectorLarge),
        ("testExample19", testDotProductWithItselfSmall),
        ("testExample20", testDotProductWithItselfLarge),
        ("testExample21", testElementProductSmall),
        ("testExample22", testElementProductLarge),
        ("testExample23", testDivide),
        ("testExample24", testMultiply),
        ("testExample25", testProduct),
        ("testExample26", testL1NormalizeSmall),
        ("testExample27", testL1NormalizeLarge),
        ("testExample28", testL2NormSmall),
        ("testExample29", testL2NormLarge),
        ("testExample30", testcosineSimilaritySmall),
        ("testExample31", testcosineSimilarityLarge),
    ]
}
