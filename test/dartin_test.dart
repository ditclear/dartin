import 'package:dartin/dartin.dart';
import 'package:flutter_test/flutter_test.dart';

import '../example/lib/dummy.dart';

void main() {

  final dummy1 = Dummy(1);
  final dummy2 = Dummy(2);

  const other = DartInScope('other');
  const params = DartInScope('params');

  final m = Module([
    single<Dummy>(({params}) =>  dummy1 ),
  ])
    ..withScope(other, [
      single<Dummy>(({params}) =>  dummy2 ),
    ])
    ..withScope(params, [
      factory<Dummy>(({params}) => Dummy(params.get(0))),
    ]);

  startDartIn([m]);

  /// test
  test('test single', () {
    expect(inject<Dummy>() == dummy1, true);
  });

  test('test scope', () {
    expect(inject<Dummy>(scope: other) == dummy2, true);
  });

  test('test params', () {
    expect(inject<Dummy>(scope: params, params: [3]).code, 3);
  });
}
