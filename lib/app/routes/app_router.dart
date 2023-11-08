import 'package:auto_route/auto_route.dart';


import 'app_router.gr.dart';            
              
@AutoRouterConfig(replaceInRouteName: "View")      
class AppRouter extends $AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [      
   AutoRoute(page: SplashViewRoute.page, initial: true),
   AutoRoute(page: OnboardingViewRoute.page),
   AutoRoute(page: DecisionViewRoute.page),
   AutoRoute(page: SignInViewRoute.page),
   AutoRoute(page: SignUpViewRoute.page),
   AutoRoute(page: AddingCardViewRoute.page),
   AutoRoute(page: AddingProductViewRoute.page),
   AutoRoute(page: NotFoundViewRoute.page),
   AutoRoute(page: HomeViewRoute.page,),
   AutoRoute(page: HomeLandViewRoute.page),
   AutoRoute(page: HomeTenViewRoute.page, ),
   AutoRoute(page: ProfileViewRoute.page),
   ];    
 }