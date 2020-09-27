import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_example/validate.dart';

class Bloc extends Object with validate implements BaseControll{
  final email = StreamController<String>();
  final pass = StreamController<String>();
  Function(String) get emailchanged => email.sink.add;
  Function(String) get passchanged => pass.sink.add;

  @override
  void dispose() {
    // TODO: implement dispose
    email?.close();
    pass?.close();
  }
  Stream<String> get checkEmail => email.stream.transform(emainCheckdata);
  Stream<String> get CheckPass => pass.stream.transform(passCheck);
  Stream<bool> get submitcheck => Rx.combineLatest2(checkEmail, CheckPass,(e,p) => true);


}
abstract class BaseControll{
  void dispose();
}