import XCTest
import VFNetwork
import TQIExtract
@testable import TQIExtract_Example

class ExtractViewModelTests: XCTestCase {
    
    var viewModel: ExtractViewModel! = .init()
    var mock: JSONMockOrchestrator!
    
    override func setUp() {
        super.setUp()
        mock = JSONMockOrchestrator()
        let provider = RequestProvider<ExtractAPI>()
        provider.executor.orchestrator = mock
        viewModel.service.provider = provider
    }
    
    override func tearDown() {
        viewModel = nil
        mock = nil
        super.tearDown()
    }
    
    func testGetTransactionsWithSuccess() {
        let expectation = self.expectation(description: "Test get transactions with success")
               mock.register(fileNamed: "getTransactionsSuccess")
               viewModel.getTransactions { result in
                   switch result {
                   case let .success(transactions):
                       XCTAssertNotNil(transactions)
                       expectation.fulfill()
                   case .failure:
                       XCTFail()
                       expectation.fulfill()
                   }
               }
               
               waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testGetTransactionsWithError() {
        let expectation = self.expectation(description: "Test get transactions with failure")
              mock.register(fileNamed: "", statusCode: 400)
              viewModel.getTransactions { result in
                  switch result {
                  case .success:
                      XCTFail()
                      expectation.fulfill()
                  case .failure(let error):
                      XCTAssertNotNil(error)
                      expectation.fulfill()
                  }
              }
              
              waitForExpectations(timeout: 10.0, handler: nil)
    }
}
