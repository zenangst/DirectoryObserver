# Directory Observer

## Description

Ever wanted your application to respond to file system changes?
Directory Observer makes it really to do just that, simply give it a path url
to the directory that you want notification from.

The public API couldn't be simpler, just initialize and provide a closure that will be invoked when there is a change in the filesystem for the target path.

## Usage

```swift
let directoryObserver = DirectoryObserver(URL: url) {
  /// Respond to filesystem change.
}
```

## Example usecases

- Manipulating locally recorded JSON payloads and have your application pick up the change without having to restart the application
- Reloading file-based configurations such as `.env` files
- Creating trigger features in your application that is based on processing files inside a directory or notifying users about a change

These are just some examples but it is really the imagination that is stopping the usefulness of this tiny framework.

## Author

Christoffer Winterkvist, christoffer@winterkvist.com

## License

**DirectoryObserver** is available under the MIT license. See the [LICENSE](https://github.com/zenangst/DirectoryObserver/blob/master/LICENSE.md) file for more info.

