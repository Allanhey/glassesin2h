import 'api_manager.dart';

Future<dynamic> postMessageCall({
  String text = 'aNewOrder',
}) =>
    ApiManager.instance.makeApiCall(
      callName: 'postMessage',
      apiDomain: 'us-east1-hw2hglasses.cloudfunctions.net',
      apiEndpoint: 'addMessage',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'text': text,
      },
      returnResponse: true,
    );
