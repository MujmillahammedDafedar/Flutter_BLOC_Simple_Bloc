import 'dart:async';


mixin validate{
  var emainCheckdata =StreamTransformer<String,String>.fromHandlers(
    handleData:(email,sink){
      if(email.contains("@")){
        sink.add(email);
      } else {
        sink.addError("Email is not valid");
      }

    }
  );
  var passCheck =StreamTransformer<String,String>.fromHandlers(
      handleData:(pass,sink){
        if(pass.length > 4){
          sink.add(pass);
        } else {
          sink.addError("Please enter at least 4 password");
        }

      }
  );
}