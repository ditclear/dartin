import 'package:dartin/dartin.dart';

import 'dummy.dart';

//constant scope
const other = DartInScope('other');
const params = DartInScope('params');

final dummy1 = Dummy(1);
final dummy2 = Dummy(2);

//define module
final m = Module([
  single<Dummy>(dummy1),
])
  ..withScope(other, [
    single<Dummy>(dummy2),
  ])
  ..withScope(params, [
    factory<Dummy>(({params}) => Dummy(params.get(0))),
  ]);

main() {

  startDartIn([m]);

  //default
  final value1 = inject<Dummy>();
  //scope
  final value2 = inject<Dummy>(scope: other);
  //parameters
  final value3 = inject<Dummy>(scope: params, params: [3]);

}
