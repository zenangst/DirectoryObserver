import Foundation
import XCTest
import DirectoryObserver

class DirectoryObserverTests: XCTestCase {
  let fileManager = FileManager()
  var url: URL = URL(string: "foo")!

  override func setUp() {
    guard let tmpDir = ProcessInfo.processInfo.environment["TMPDIR"],
          let bundleIdentifier = Bundle(for: DirectoryObserver.self).bundleIdentifier else {
      XCTFail("Failed to resolve `TMPDIR` from environment")
      return
    }

    url = URL(fileURLWithPath: tmpDir.appending(bundleIdentifier))
    try? fileManager.createDirectory(at: url, withIntermediateDirectories: false, attributes: nil)
    
  }

  override func tearDown() {
    try? fileManager.removeItem(at: url)
  }

  func testDirectoryObserver() {
    let expectation = self.expectation(description: "Wait for directory observer to register file system event.")
    let directoryObserver = DirectoryObserver(at: url) {
      expectation.fulfill()
    }

    let filePath = url
      .appendingPathComponent("/\(UUID().uuidString)")
      .absoluteString.replacingOccurrences(of: "file://", with: "")
    let contents = UUID().uuidString
    fileManager.createFile(atPath: filePath, contents: contents.data(using: .utf8), attributes: nil)
    wait(for: [expectation], timeout: 10.0)
  }
}
