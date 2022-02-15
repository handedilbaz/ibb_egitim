import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:fsc_ibb/core/logger.dart';

class ChatViewModel extends BaseViewModel {
  Logger log;

  CallViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
