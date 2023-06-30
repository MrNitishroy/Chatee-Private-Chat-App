import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    screenManage();
  }

  void screenManage() {
    Future.delayed(Duration(seconds: 6), () {
      if (auth.currentUser != null) {
        Get.offAllNamed("/chat-contact-page");
      } else {
        Get.offAllNamed("/welcome-page");
      }
    });
  }
}
