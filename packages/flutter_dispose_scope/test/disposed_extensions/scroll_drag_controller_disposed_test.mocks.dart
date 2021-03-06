// Mocks generated by Mockito 5.0.8 from annotations
// in flutter_dispose_scope/test/disposed_extensions/scroll_drag_controller_disposed_test.dart.
// Do not manually edit this file.

import 'package:flutter/src/gestures/drag_details.dart' as _i3;
import 'package:flutter/src/widgets/scroll_activity.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeScrollActivityDelegate extends _i1.Fake
    implements _i2.ScrollActivityDelegate {}

/// A class which mocks [ScrollDragController].
///
/// See the documentation for Mockito's code generation for more information.
class MockScrollDragController extends _i1.Mock
    implements _i2.ScrollDragController {
  MockScrollDragController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ScrollActivityDelegate get delegate =>
      (super.noSuchMethod(Invocation.getter(#delegate),
              returnValue: _FakeScrollActivityDelegate())
          as _i2.ScrollActivityDelegate);
  @override
  void updateDelegate(_i2.ScrollActivityDelegate? value) =>
      super.noSuchMethod(Invocation.method(#updateDelegate, [value]),
          returnValueForMissingStub: null);
  @override
  void update(_i3.DragUpdateDetails? details) =>
      super.noSuchMethod(Invocation.method(#update, [details]),
          returnValueForMissingStub: null);
  @override
  void end(_i3.DragEndDetails? details) =>
      super.noSuchMethod(Invocation.method(#end, [details]),
          returnValueForMissingStub: null);
  @override
  void cancel() => super.noSuchMethod(Invocation.method(#cancel, []),
      returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  String toString() =>
      (super.noSuchMethod(Invocation.method(#toString, []), returnValue: '')
          as String);
}
