import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class ProcessMatchingCommissionCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ProcessMatchingCommission',
      apiUrl:
          'https://us-central1-saamarth-4cacd.cloudfunctions.net/processMatchingCommissions',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
