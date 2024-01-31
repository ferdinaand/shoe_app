// import 'package:flutter/foundation.dart';

// import '../routing/app_pages.dart';


// Future<void> initializeHive() async {
//   //Get application directory (storage directory on device)
//   final dir = await getApplicationDocumentsDirectory();
//   await Hive.initFlutter(dir.path);

//   //Open all hive boxes here
//   // await Hive.openBox<UserRepo?>('user');

//   //register all adapters here
//   // Hive.registerAdapter<UserRepo>(UserRepoAdapter());
// }

// void setupLogging() {
//   Logger.root.level = Level.ALL;
//   Logger.root.onRecord.listen((rec) {
//     if (kDebugMode) {
//       print('${rec.level.name}: ${rec.time}: ${rec.message}');
//     }
//   });
// }

// Future<void> initializeServices() async {
//   ///Init all services here
//   Get
//     // ..lazyPut(StorageService.new)
//     // ..lazyPut(ThemeService.new)
//     ..lazyPut(NavigationService.new)
//     ..lazyPut(BaseController.new, fenix: true);
//   Get.put(OnboardingController());
//   Get.put(UserSigninController());
//   Get.put(HomeController());
//   Get.put(TruckManagerHomeController());
// }

// Future<String> calculateInitialRoute() async {
//   String routes = Routes.onboarding;

//   // Check if userData or gymOwnerData box exists in Hive
//   final userDataBox = await Hive.openBox('userData');
//   final truckManagerDataBox = await Hive.openBox('truckManagerData');

//   // // Check if userData or gymOwnerData token has expired
//   // final userDataToken = userDataBox.get('token');
//   // final gymOwnerDataToken = gymOwnerDataBox.get('token');

//   if (userDataBox.isNotEmpty) {
//     routes = Routes.dashLayout;
//   } else if (truckManagerDataBox.isNotEmpty) {
//     routes = Routes.truckManagerDashLayout;
//   } else {
//     routes = Routes.onboarding;
//   }

//   return routes;
// }

// bool ChooseRoleRoute = false;
// bool GymOwnerSelect = false;
// bool userSelect = false;
// String userName = '';
// String firstName = '';
// String phoneNumber = '';
// late bool isLoading;
// bool isLoggedIn = false;

// late Box box1;
