import 'package:juejin/api/request.dart';

class HomeRequest extends BaseRequest {
  Future getFollowList() async {
    return await get("/api/follow");
  }
}
