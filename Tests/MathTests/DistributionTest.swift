import XCTest
@testable import Math

final class DistributionTest: XCTestCase {
    
    func testZNormal(){
        XCTAssertEqual(0.5, Distribution.zNormal(z: 0.0), accuracy: 0.01)
        XCTAssertEqual(0.69146, Distribution.zNormal(z: 0.5), accuracy: 0.00001)
        XCTAssertEqual(0.84134, Distribution.zNormal(z: 1.0), accuracy: 0.00001)
        XCTAssertEqual(0.93319, Distribution.zNormal(z: 1.5), accuracy: 0.00001)
        XCTAssertEqual(0.97725, Distribution.zNormal(z: 2.0), accuracy: 0.00001)
        XCTAssertEqual(0.99379, Distribution.zNormal(z: 2.5), accuracy: 0.00001)
        XCTAssertEqual(0.99865, Distribution.zNormal(z: 3.0), accuracy: 0.00001)
        XCTAssertEqual(0.99977, Distribution.zNormal(z: 3.5), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 0.5), Distribution.zNormal(z: -0.5), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 1.0), Distribution.zNormal(z: -1.0), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 1.5), Distribution.zNormal(z: -1.5), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 2.0), Distribution.zNormal(z: -2.0), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 2.5), Distribution.zNormal(z: -2.5), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 3.0), Distribution.zNormal(z: -3.0), accuracy: 0.00001)
        XCTAssertEqual(1 - Distribution.zNormal(z: 3.5), Distribution.zNormal(z: -3.5), accuracy: 0.00001)
    }

    func testZInverse(){
        XCTAssertEqual(0.0, Distribution.zInverse(p: 0.5), accuracy: 0.00001)
        XCTAssertEqual(0.841621, Distribution.zInverse(p: 0.8), accuracy: 0.00001)
        XCTAssertEqual(1.281552, Distribution.zInverse(p: 0.9), accuracy: 0.00001)
        XCTAssertEqual(1.644854, Distribution.zInverse(p: 0.95), accuracy: 0.00001)
        XCTAssertEqual(2.053749, Distribution.zInverse(p: 0.98), accuracy: 0.00001)
        XCTAssertEqual(2.326348, Distribution.zInverse(p: 0.99), accuracy: 0.00001)
        XCTAssertEqual(2.575829, Distribution.zInverse(p: 0.995), accuracy: 0.00001)
        XCTAssertEqual(2.878162, Distribution.zInverse(p: 0.998), accuracy: 0.00001)
        XCTAssertEqual(3.090232, Distribution.zInverse(p: 0.999), accuracy: 0.00001)
    }

    func testChiSquare(){
        XCTAssertEqual(0.05, Distribution.chiSquare(x: 3.841, freedom: 1), accuracy: 0.0001)
        XCTAssertEqual(0.005, Distribution.chiSquare(x: 7.879, freedom: 1), accuracy: 0.0001)
        XCTAssertEqual(0.95, Distribution.chiSquare(x: 3.940, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.05, Distribution.chiSquare(x: 18.307, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.995, Distribution.chiSquare(x: 2.156, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.005, Distribution.chiSquare(x: 25.188, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.95, Distribution.chiSquare(x: 77.929, freedom: 100), accuracy: 0.0001)
        XCTAssertEqual(0.05, Distribution.chiSquare(x: 124.342, freedom: 100), accuracy: 0.0001)
        XCTAssertEqual(0.995, Distribution.chiSquare(x: 67.328, freedom: 100), accuracy: 0.0001)
        XCTAssertEqual(0.005, Distribution.chiSquare(x: 140.169, freedom: 100), accuracy: 0.0001)
    }

    func testChiSquareInverse(){
        XCTAssertEqual(2.706, Distribution.chiSquareInverse(p: 0.1, freedom: 1), accuracy: 0.001)
        XCTAssertEqual(6.635, Distribution.chiSquareInverse(p: 0.01, freedom: 1), accuracy: 0.001)
        XCTAssertEqual(4.865, Distribution.chiSquareInverse(p: 0.9, freedom: 10), accuracy: 0.001)
        XCTAssertEqual(15.987, Distribution.chiSquareInverse(p: 0.1, freedom: 10), accuracy: 0.001)
        XCTAssertEqual(2.558, Distribution.chiSquareInverse(p: 0.99, freedom: 10), accuracy: 0.001)
        XCTAssertEqual(23.209, Distribution.chiSquareInverse(p: 0.01, freedom: 10), accuracy: 0.001)
        XCTAssertEqual(82.358, Distribution.chiSquareInverse(p: 0.9, freedom: 100), accuracy: 0.001)
        XCTAssertEqual(118.498, Distribution.chiSquareInverse(p: 0.1, freedom: 100), accuracy: 0.001)
        XCTAssertEqual(70.065, Distribution.chiSquareInverse(p: 0.99, freedom: 100), accuracy: 0.001)
        XCTAssertEqual(135.807, Distribution.chiSquareInverse(p: 0.01, freedom: 100), accuracy: 0.001)
    }

    func testFDistribution(){
        XCTAssertEqual(0.1, Distribution.fDistribution(F: 39.86346, freedom1: 1, freedom2: 1), accuracy: 0.00001)
        XCTAssertEqual(0.1, Distribution.fDistribution(F: 2.32260, freedom1: 10, freedom2: 10), accuracy: 0.00001)
        XCTAssertEqual(0.1, Distribution.fDistribution(F: 1.79384, freedom1: 20, freedom2: 20), accuracy: 0.00001)
        XCTAssertEqual(0.1, Distribution.fDistribution(F: 1.60648, freedom1: 30, freedom2: 30), accuracy: 0.00001)
        XCTAssertEqual(0.05, Distribution.fDistribution(F: 161.4476, freedom1: 1, freedom2: 1), accuracy: 0.00001)
        XCTAssertEqual(0.05, Distribution.fDistribution(F: 2.9782, freedom1: 10, freedom2: 10), accuracy: 0.00001)
        XCTAssertEqual(0.05, Distribution.fDistribution(F: 2.1242, freedom1: 20, freedom2: 20), accuracy: 0.00001)
        XCTAssertEqual(0.05, Distribution.fDistribution(F: 1.8409, freedom1: 30, freedom2: 30), accuracy: 0.00001)
        XCTAssertEqual(0.01, Distribution.fDistribution(F: 4052.181, freedom1: 1, freedom2: 1), accuracy: 0.00001)
        XCTAssertEqual(0.01, Distribution.fDistribution(F: 4.849, freedom1: 10, freedom2: 10), accuracy: 0.00001)
        XCTAssertEqual(0.01, Distribution.fDistribution(F: 2.938, freedom1: 20, freedom2: 20), accuracy: 0.00001)
        XCTAssertEqual(0.01, Distribution.fDistribution(F: 2.386, freedom1: 30, freedom2: 30), accuracy: 0.00001)
    }

    func testFDistributionInverse(){
        XCTAssertEqual(3.818, Distribution.fDistributionInverse(p: 0.01, freedom1: 5, freedom2: 26), accuracy: 0.001)
        XCTAssertEqual(15.1010, Distribution.fDistributionInverse(p: 0.025, freedom1: 4, freedom2: 3), accuracy: 0.001)
        XCTAssertEqual(2.19535, Distribution.fDistributionInverse(p: 0.1, freedom1: 8, freedom2: 13), accuracy: 0.001)
        XCTAssertEqual(2.29871, Distribution.fDistributionInverse(p: 0.1, freedom1: 3, freedom2: 27), accuracy: 0.001)
        XCTAssertEqual(3.4381, Distribution.fDistributionInverse(p: 0.05, freedom1: 8, freedom2: 8), accuracy: 0.001)
        XCTAssertEqual(2.6283, Distribution.fDistributionInverse(p: 0.05, freedom1: 6, freedom2: 19), accuracy: 0.001)
        XCTAssertEqual(3.3120, Distribution.fDistributionInverse(p: 0.025, freedom1: 9, freedom2: 13), accuracy: 0.001)
        XCTAssertEqual(3.7505, Distribution.fDistributionInverse(p: 0.025, freedom1: 3, freedom2: 23), accuracy: 0.001)
        XCTAssertEqual(4.155, Distribution.fDistributionInverse(p: 0.01, freedom1: 12, freedom2: 12), accuracy: 0.001)
        XCTAssertEqual(6.851, Distribution.fDistributionInverse(p: 0.01, freedom1: 1, freedom2: 120), accuracy: 0.001)
    }

    func testTDistribution(){
        XCTAssertEqual(0.05, Distribution.tDistribution(T: 6.314, freedom: 1), accuracy: 0.0001)
        XCTAssertEqual(0.005, Distribution.tDistribution(T: 63.656, freedom: 1), accuracy: 0.0001)
        XCTAssertEqual(0.05, Distribution.tDistribution(T: 1.812, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.01, Distribution.tDistribution(T: 2.764, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.005, Distribution.tDistribution(T: 3.169, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.001, Distribution.tDistribution(T: 4.144, freedom: 10), accuracy: 0.0001)
        XCTAssertEqual(0.05, Distribution.tDistribution(T: 1.725, freedom: 20), accuracy: 0.0001)
        XCTAssertEqual(0.01, Distribution.tDistribution(T: 2.528, freedom: 20), accuracy: 0.0001)
        XCTAssertEqual(0.005, Distribution.tDistribution(T: 2.845, freedom: 20), accuracy: 0.0001)
        XCTAssertEqual(0.001, Distribution.tDistribution(T: 3.552, freedom: 20), accuracy: 0.0001)
    }

    func testTDistributionInverse(){
        XCTAssertEqual(2.947, Distribution.tDistributionInverse(p: 0.005, freedom: 15), accuracy: 0.001)
        XCTAssertEqual(1.717, Distribution.tDistributionInverse(p: 0.05, freedom: 22), accuracy: 0.001)
        XCTAssertEqual(3.365, Distribution.tDistributionInverse(p: 0.01, freedom: 5), accuracy: 0.001)
        XCTAssertEqual(3.922, Distribution.tDistributionInverse(p: 0.0005, freedom: 18), accuracy: 0.001)
        XCTAssertEqual(3.467, Distribution.tDistributionInverse(p: 0.001, freedom: 24), accuracy: 0.001)
        XCTAssertEqual(6.314, Distribution.tDistributionInverse(p: 0.05, freedom: 1), accuracy: 0.001)
        XCTAssertEqual(2.306, Distribution.tDistributionInverse(p: 0.025, freedom: 8), accuracy: 0.001)
        XCTAssertEqual(3.646, Distribution.tDistributionInverse(p: 0.001, freedom: 17), accuracy: 0.001)
        XCTAssertEqual(3.373, Distribution.tDistributionInverse(p: 0.0005, freedom: 120), accuracy: 0.001)
    }

    static var allTests = [
        ("testExample1", testZNormal),
        ("testExample2", testZInverse),
        ("testExample3", testChiSquare),
        ("testExample4", testChiSquareInverse),
        ("testExample5", testFDistribution),
        ("testExample6", testFDistributionInverse),
        ("testExample7", testTDistribution),
        ("testExample8", testTDistributionInverse),
    ]
}
