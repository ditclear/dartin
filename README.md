# dartin

![](https://img.shields.io/badge/build-passing-brightgreen.svg) [![](https://img.shields.io/badge/pub-v0.1.0-blue.svg)](https://pub.dartlang.org/packages/dartin)  ![](https://img.shields.io/badge/support-dart|flutter-red.svg)

A pragmatic lightweight dependency injection framework for Flutter developers.

 A light container inspired by [flutter-provide](https://github.com/google/flutter-provide) and [koin](https://github.com/InsertKoinIO/koin).

more examples see  [mvvm_flutter](https://github.com/ditclear/mvvm_flutter).

### Setup

```yaml
dependencies:
  dartin: ^0.1.5
  
```

### Key methods

- **single**：Creates a provider which will initialize using the [_DartInFunction]
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
  ..withScope(test , [
    ///other scope
   factory<HomeProvide>(({params}) => HomeProvide(params.get(0), get<GithubRepo>())),
  ]);

final repoModule = Module([
  single<GithubRepo>(({params}) => GithubRepo(get<GithubService>())),
]);

final remoteModule = Module([
  single<GithubService>(({params}) => GithubService()),
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

### Article

【Medium】：[DartIn:A pragmatic lightweight dependency injection framework for Flutter developers](https://medium.com/@ditclear/dartin-a-pragmatic-lightweight-dependency-injection-framework-for-flutter-developers-bbb57c47b31f)

【简书】：[为Flutter而生的轻量级依赖检索容器—DartIn](https://www.jianshu.com/p/a13d38ba617f)

【掘金】：[为Flutter而生的轻量级依赖检索容器—DartIn](https://juejin.im/post/5c95b7c2f265da60cc02b258)

### Licence

BSD