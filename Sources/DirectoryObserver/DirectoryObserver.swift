import Foundation

public class DirectoryObserver {
    private let fileDescriptor: CInt
    private let source: DispatchSourceProtocol

    public init(at url: URL, block: @escaping () -> Void) {
        self.fileDescriptor = open(url.path, O_EVTONLY)
        self.source = DispatchSource.makeFileSystemObjectSource(
            fileDescriptor: self.fileDescriptor,
            eventMask: .write,
            queue: DispatchQueue.main)
        self.source.setEventHandler { block() }
        self.source.resume()
    }

    deinit {
        source.cancel()
        close(fileDescriptor)
    }
}
