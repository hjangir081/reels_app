import 'package:get_it/get_it.dart';
import '../router/app_router.dart';

final getIt = GetIt.instance;

Future<void> initializeApp() async {
  final appRouter = AppRouter();
  getIt.registerLazySingleton<AppRouter>(() => appRouter);
}
