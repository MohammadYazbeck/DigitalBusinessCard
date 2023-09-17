import '../../view/screen/profile.dart';
import '../../view/screen/profile1.dart';
import '../../view/screen/profile2.dart';
import '../../view/screen/profile3.dart';

chooseTemplate(int templatenumber) {
  if (templatenumber == 0) {
    return const ProfilePage();
  }
  if (templatenumber == 1) {
    return const ProfilePage1();
  }
  if (templatenumber == 2) {
    return const ProfilePage2();
  }
  if (templatenumber == 3) {
    return const ProfilePage3();
  }
}
