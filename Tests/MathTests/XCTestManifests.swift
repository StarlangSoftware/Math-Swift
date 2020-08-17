import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DistributionTest.allTests),
        testCase(DiscreteDistributionTest.allTests),
        testCase(MatrixTest.allTests),
        testCase(VectorTest.allTests),
    ]
}
#endif
