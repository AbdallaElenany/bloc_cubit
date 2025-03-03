import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/block_observer.dart';
import 'core/helpers/navigation_service.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/services/offline_service/offline_storage_service.dart';
import 'core/services/offline_service/offline_sync_service.dart';
import 'core/theming/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await OfflineStorageService.init();
  OfflineSyncService.startListening();
  Bloc.observer = SimpleBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'bloc_cubit App',
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.masterHome,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
