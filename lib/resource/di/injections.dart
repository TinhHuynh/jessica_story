import '../../data/di/dependency.dart';
import '../../shared_libraries/core/di/dependency.dart';

class Injections {
  void init() {
    // Shared modules
    RegisterCoreModule();

    // Feature modules
    RegisterVideoModule();
  }
}
