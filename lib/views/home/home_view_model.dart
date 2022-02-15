import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:fsc_ibb/core/logger.dart';
import 'home_modal.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends BaseViewModel {
  Logger log;

  HomeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}

const baseUrl = "http://api.dilbazsoft.com/Egitim/test.json";

List<Calls> callsList = List<Calls>.empty(growable: true);

Future<List<Calls>> getCalls() async {
  Uri callUrl = Uri.parse(baseUrl);
  final response = await http.get(callUrl);

  final contents = json.decode(response.body) as List;
  List<Calls> returnCalls = contents.map((i) => Calls.fromJson(i)).toList();

  return returnCalls;
}
