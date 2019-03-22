# dartin

![](https://img.shields.io/badge/build-passing-brightgreen.svg) [![](https://img.shields.io/badge/pub-v0.0.1-blue.svg)](https://pub.dartlang.org/packages/dartin)  ![](https://img.shields.io/badge/support-dart|flutter-red.svg)

A pragmatic lightweight dependency injection framework for Flutter developers.

 A light container inspired by [flutter-provide](https://github.com/google/flutter-provide) and [koin](https://github.com/InsertKoinIO/koin).

more examples see  [mvvm_flutter](https://github.com/ditclear/mvvm_flutter).

### Setup

```yaml
dependencies:
  dartin: ^0.0.1
  
```

### Key methods

- **single**：Creates a provider with the value provided to it.
- **lazy**：Creates a provider which will initialize using the [_DartInFunction]
  the first time the value is requested.

- **factory**：Creates a provider that provides a new value using the [_DartInFunction] for each
   requestor of the value.
- **inject<T>**：get T  from dartIns by T.runtimeType and params

more informations see [**dartin.dart**](https://github.com/ditclear/dartin/blob/master/lib/dartin.dart).

### Getting Started

1. #### declare  dartin modules

```dart
//scope should always be initialized as a static const and passed around.
const test = DartInScope('test');

final viewModelModule = Module([
  factory<HomeProvide>(({params}) => HomeProvide(params.get(0), get<GithubRepo>())),
])
  ..addOthers(test , [
    ///other scope
   factory<HomeProvide>(({params}) => HomeProvide(params.get(0), get<GithubRepo>())),
  ]);

final repoModule = Module([
  lazy<GithubRepo>(({params}) => GithubRepo(get<GithubService>())),
]);

final remoteModule = Module([
  single<GithubService>(GithubService()),
]);

final appModule = [viewModelModule, repoModule, remoteModule];

```

2. #### Start dartin

```dart
void main() {
  startDartIn(appModule);
  runApp(MyApp());
}
```

3. #### inject

```dart
//default
final service = inject<GithubService>();
//pass parameters
final test = inject<HomeProvide>(params: ['title']);
//different scope
final test = inject<HomeProvide>(scope:test,params: ['title']);

```

DartIn is easy to use, and still improving.

🍺 welcome to fork and pull request。

### Licence

BSD