import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarController extends GetxController {
  RxString avatarProfile = "assets/person.png".obs;

  @override
  onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    avatarProfile.value = prefs.getString('avatar') ?? "assets/person.png";
    print(prefs.getString('avatar'));
    super.onInit();
  }

  saveToSharePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('avatar', avatarProfile.value);
  }
}
