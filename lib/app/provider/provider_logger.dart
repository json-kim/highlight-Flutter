import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    print('''
Provider Add
{
  provider: ${provider.name},
  value: ${value},
}
''');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    print('''
Provider Dispose
{
  provider: ${provider.name},
}
''');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print('''
Provider Update
{
  provider: ${provider.name},
  value: ${previousValue} to ${newValue},
}
''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    print('''
Provider Fail
{
  provider: ${provider.name},
  error: ${error},
  stack trace: ${stackTrace}
}
''');
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
