## 2.0.1

- Fix extensions for `Process` from `dart:io` not being exported (#30)

## 2.0.0

- Add safety checks (#25)
  - Throw `StateError` if `DisposeScope.dispose()` is called more than once
  - Add `DisposeScope.run()` which will run a callback only if dispose scope is
    not disposed
- Rename extensions from `disposed()` to `disposedBy` (#24)
- Add `disposedBy()` extension for `Process` from `dart:io` (#19)

## 1.0.0

- Initial release
