class TfLite {
  static run() async {
    /*final interpreter = await Interpreter.fromAsset('model.tflite'); 
    var input = imageToByteListFloat32(image, 224, 127.5, 127.5);
    var output = List.filled(1001, 0).reshape([1, 1001]);
    interpreter.run(input, output);
    print('Prediction:${output.indexWhere((e) => e == output.reduce(max))}');
*/
  }

  /* Future<String> sendMessage(String message) async {
   final token = "YOUR_DIALOGFLOW_CLIENT_TOKEN";
   final response = await http.post(
   Uri.parse("https://api.dialogflow.com/v1/query?v=20150910"),
   headers: {'Authorization':'Bearer $token', 'Content-Type': 'application/json'},
       body: jsonEncode({
   "lang": "en",
   "query": message,
   "sessionId": "flutter_user_001",}),);
   final data = jsonDecode(response.body);
   return data['result']['fulfillment']['speech'];
  }*/
}
