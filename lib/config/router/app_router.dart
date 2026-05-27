import 'package:auto_route/auto_route.dart';
import 'package:reels_app/config/router/app_router.gr.dart';

import '../../utils/constants/app_path.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: AppPaths.splashPage, initial: true),
    AutoRoute(page: ReelsRoute.page, path: AppPaths.reelsPage),
  ];
}