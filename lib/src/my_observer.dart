import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';

class MyObserver extends ProviderObserver {
  MyObserver({this.providers});

  final List<ProviderBase>? providers;
  bool _validate(ProviderBase<Object?> provider) => providers == null || (providers != null && providers!.contains(provider));
  String _handeLongData(Object? value) {
    final result = '$value';
    if (result.length > 30) {
      if (value is List) {
        return value.toStringLines();
      }
      if (value is Map) {
        return value.toStringLines();
      }
    }
    return result;
  }
  String _handleValue(ProviderBase<Object?> provider, Object? value) {
    final valueType = '${provider.runtimeType}'.split('Provider')[1];
    if(value is AsyncValue){
      return value.when(
        data: (Object? data) => 'AsyncData$valueType: ${_handeLongData(data)}',
        error: (error, _) => 'AsyncError$valueType: $error',
        loading: ()=> 'AsyncLoading$valueType',
      );
    } else {
      return _handeLongData(value);
    }
  }
  String _handleProviderName(ProviderBase<Object?> provider) => '${provider.name?.replaceAll('Provider', '').toUpperFirst()}(${provider.argument})';
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    if (_validate(provider)) {
      log('[Provider ${_handleProviderName(provider)}]: was added with initialValue: ${_handleValue(provider, value)}');
    }
    super.didAddProvider(provider, value, container);
  }
  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    if (_validate(provider)) {
      log('[Provider ${_handleProviderName(provider)}]: was disposed');
    }
    super.didDisposeProvider(provider, container);
  }
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    if (_validate(provider)) {
      log('[Provider ${_handleProviderName(provider)}]: updated,\n  from: ${_handleValue(provider, previousValue)} \n  to: ${_handleValue(provider, newValue)}');
    }
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error, StackTrace stackTrace, ProviderContainer container) {
    if (_validate(provider)) {
      // log('[Provider ${_handleProviderName(provider)}]: failed', error: error, stackTrace: stackTrace);
      log('[Provider ${_handleProviderName(provider)}]: failed', error: error);
    }
    super.providerDidFail(provider, error, stackTrace, container);
  }
}