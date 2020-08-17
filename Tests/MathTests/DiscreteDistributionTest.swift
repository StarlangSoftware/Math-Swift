import XCTest
@testable import Math

final class DiscreteDistributionTest: XCTestCase {
    var smallDistribution : DiscreteDistribution = DiscreteDistribution()

    override func setUp(){
        self.smallDistribution = DiscreteDistribution()
        self.smallDistribution.addItem(item: "item1")
        self.smallDistribution.addItem(item: "item2")
        self.smallDistribution.addItem(item: "item3")
        self.smallDistribution.addItem(item: "item1")
        self.smallDistribution.addItem(item: "item2")
        self.smallDistribution.addItem(item: "item1")
    }

    func testAddItem1(){
        XCTAssertEqual(3, self.smallDistribution.getCount(item: "item1"))
        XCTAssertEqual(2, self.smallDistribution.getCount(item: "item2"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item3"))
    }

    func testAddItem2(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        for _ in 0..<1000{
            discreteDistribution.addItem(item: String(Int.random(in: 0..<1000)))
        }
        var count : Int = 0
        for i in 0..<1000{
            if discreteDistribution.containsItem(item: String(i)){
                count += discreteDistribution.getCount(item: String(i))
            }
        }
        XCTAssertEqual(1000, count)
    }

    func testAddItem3(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        for _ in 0..<1000{
            discreteDistribution.addItem(item: String(Int.random(in: 0..<1000)))
        }
        for _ in 0..<1000000{
            discreteDistribution.addItem(item: String(Int.random(in: 0..<1000000)))
        }
        XCTAssertEqual(Double(discreteDistribution.size()) / 1000000.0, 0.63212, accuracy: 0.001)
    }

    func testRemoveItem(){
        self.smallDistribution.removeItem(item: "item1")
        self.smallDistribution.removeItem(item: "item2")
        self.smallDistribution.removeItem(item: "item3")
        XCTAssertEqual(2, self.smallDistribution.getCount(item: "item1"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item2"))
        self.smallDistribution.addItem(item: "item1")
        self.smallDistribution.addItem(item: "item2")
        self.smallDistribution.addItem(item: "item3")
    }

    func testAddDistribution1(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        discreteDistribution.addItem(item: "item4")
        discreteDistribution.addItem(item: "item5")
        discreteDistribution.addItem(item: "item5")
        discreteDistribution.addItem(item: "item2")
        self.smallDistribution.addDistribution(distribution: discreteDistribution)
        XCTAssertEqual(3, self.smallDistribution.getCount(item: "item1"))
        XCTAssertEqual(3, self.smallDistribution.getCount(item: "item2"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item3"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item4"))
        XCTAssertEqual(2, self.smallDistribution.getCount(item: "item5"))
        self.smallDistribution.removeDistribution(distribution: discreteDistribution)
    }

    func testAddDistribution2(){
        let discreteDistribution1 : DiscreteDistribution = DiscreteDistribution()
        for i in 0..<1000{
            discreteDistribution1.addItem(item: String(i))
        }
        let discreteDistribution2 : DiscreteDistribution = DiscreteDistribution()
        for i in 500..<1000{
            discreteDistribution2.addItem(item: String(1000 + i))
        }
        discreteDistribution1.addDistribution(distribution: discreteDistribution2)
        XCTAssertEqual(1500, discreteDistribution1.size())
    }

    func testRemoveDistribution(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        discreteDistribution.addItem(item: "item1")
        discreteDistribution.addItem(item: "item1")
        discreteDistribution.addItem(item: "item2")
        self.smallDistribution.removeDistribution(distribution: discreteDistribution)
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item1"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item2"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item3"))
        self.smallDistribution.addDistribution(distribution: discreteDistribution)
    }

    func testGetSum1(){
        XCTAssertEqual(6, self.smallDistribution.getSum())
    }

    func testGetSum2(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        for _ in 0..<1000{
            discreteDistribution.addItem(item: String(Int.random(in: 0..<1000)))
        }
        XCTAssertEqual(1000, discreteDistribution.getSum())
    }

    func testGetIndex(){
        XCTAssertEqual(0, self.smallDistribution.getIndex(item: "item1"))
        XCTAssertEqual(1, self.smallDistribution.getIndex(item: "item2"))
        XCTAssertEqual(2, self.smallDistribution.getIndex(item: "item3"))
    }

    func testContainsItem(){
        XCTAssertTrue(self.smallDistribution.containsItem(item: "item1"))
        XCTAssertFalse(self.smallDistribution.containsItem(item: "item4"))
    }

    func testGetItem(){
        XCTAssertEqual("item1", self.smallDistribution.getItem(index: 0))
        XCTAssertEqual("item2", self.smallDistribution.getItem(index: 1))
        XCTAssertEqual("item3", self.smallDistribution.getItem(index: 2))
    }

    func testGetValue(){
        XCTAssertEqual(3, self.smallDistribution.getValue(index: 0))
        XCTAssertEqual(2, self.smallDistribution.getValue(index: 1))
        XCTAssertEqual(1, self.smallDistribution.getValue(index: 2))
    }

    func testGetCount(){
        XCTAssertEqual(3, self.smallDistribution.getCount(item: "item1"))
        XCTAssertEqual(2, self.smallDistribution.getCount(item: "item2"))
        XCTAssertEqual(1, self.smallDistribution.getCount(item: "item3"))
    }

    func testGetMaxItem1(){
        XCTAssertEqual("item1", self.smallDistribution.getMaxItem())
    }

    func testGetMaxItem2(){
        let include : [String] = ["item2", "item3"]
        XCTAssertEqual("item2", self.smallDistribution.getMaxItemIncludeTheseOnly(includeTheseOnly: include))
    }

    func testGetProbability1(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        for i in 0..<1000{
            discreteDistribution.addItem(item: String(i))
        }
        XCTAssertEqual(0.001, discreteDistribution.getProbability(item: String(Int.random(in: 0..<1000))))
    }

    func testGetProbability2(){
        XCTAssertEqual(0.5, self.smallDistribution.getProbability(item: "item1"))
        XCTAssertEqual(0.333333, self.smallDistribution.getProbability(item: "item2"), accuracy: 0.0001)
        XCTAssertEqual(0.166667, self.smallDistribution.getProbability(item: "item3"), accuracy: 0.0001)
    }

    func testGetProbabilityLaplaceSmoothing1(){
        let discreteDistribution : DiscreteDistribution = DiscreteDistribution()
        for i in 0..<1000{
            discreteDistribution.addItem(item: String(i))
        }
        XCTAssertEqual(2.0 / 2001, discreteDistribution.getProbabilityLaplaceSmoothing(item: String(Int.random(in: 0..<1000))))
        XCTAssertEqual(1.0 / 2001, discreteDistribution.getProbabilityLaplaceSmoothing(item: "item0"))
    }

    func testgetProbabilityLaplaceSmoothing2(){
        XCTAssertEqual(0.4, self.smallDistribution.getProbabilityLaplaceSmoothing(item: "item1"))
        XCTAssertEqual(0.3, self.smallDistribution.getProbabilityLaplaceSmoothing(item: "item2"))
        XCTAssertEqual(0.2, self.smallDistribution.getProbabilityLaplaceSmoothing(item: "item3"))
        XCTAssertEqual(0.1, self.smallDistribution.getProbabilityLaplaceSmoothing(item: "item4"))
    }

    func testEntropy(){
        XCTAssertEqual(1.4591, self.smallDistribution.entropy(), accuracy: 0.0001)
    }

    static var allTests = [
        ("testExample1", testAddItem1),
        ("testExample2", testAddItem2),
        ("testExample3", testAddItem3),
        ("testExample4", testRemoveItem),
        ("testExample5", testAddDistribution1),
        ("testExample6", testAddDistribution2),
        ("testExample7", testRemoveDistribution),
        ("testExample8", testGetSum1),
        ("testExample9", testGetSum2),
        ("testExample10", testGetIndex),
        ("testExample11", testContainsItem),
        ("testExample12", testGetItem),
        ("testExample13", testGetValue),
        ("testExample14", testGetCount),
        ("testExample15", testGetMaxItem1),
        ("testExample16", testGetMaxItem2),
        ("testExample17", testGetProbability1),
        ("testExample18", testGetProbability2),
        ("testExample19", testGetProbabilityLaplaceSmoothing1),
        ("testExample20", testgetProbabilityLaplaceSmoothing2),
        ("testExample21", testEntropy),
    ]

}
