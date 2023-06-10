import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''{
        onChange: ${provider.name ?? provider.runtimeType}, 
        currentState: {$previousValue},
        nextState: {$newValue} 
    }''');
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('''{
    onError: ${provider.name ?? provider.runtimeType},
    Error: $error
    }''');
  }
}
