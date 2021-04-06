import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ChangeLogger extends ProviderObserver {
  ChangeLogger({required this.logger});
  final Logger logger;

  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    if (newValue != null) {
      var providerId = provider.name ?? provider.runtimeType;
      var value = newValue as StateController;
      if (value.state != null) {
        newValue = value.state;
      }
      this.logger.d('State: "$providerId" changed to "$newValue"');
    }
  }

  @override
  void didAddProvider(ProviderBase provider, Object? value) {
    var providerId = provider.name ?? provider.runtimeType;
    this.logger.d('Added new provider "$providerId"');
  }

  @override
  void didDisposeProvider(ProviderBase provider) {
    var providerId = provider.name ?? provider.runtimeType;
    this.logger.d('Removed provider "$providerId"');
  }
}
