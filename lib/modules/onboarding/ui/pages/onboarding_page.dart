import 'package:flutter/material.dart';

import '../../../../blocs/bloc_responsive.dart';
import '../../../../blocs/navigator_bloc.dart';
import '../../../../ui/widgets/responsive/my_app_scaffold_widget.dart';
import '../widgets/basic_profile_widget.dart';
import '../widgets/card_option_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.responsiveBloc,
    //required this.profileModule,
    required this.navigatorBloc,
    super.key,
  });
  final ResponsiveBloc responsiveBloc;
  //final ProfileModule profileModule;
  final NavigatorBloc navigatorBloc;

  @override
  Widget build(BuildContext context) {
    const Widget spaceCard = SizedBox(height: 20);
    return MyAppScaffold(
      withAppbar: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Widget del perfil
              BasicProfileWidget(
                key: const Key(
                  'OnboardingPage_BasicProfileWidget_UserProfileCard',
                ),
                responsiveBloc: responsiveBloc,
                navigatorBloc: navigatorBloc,
              ),
              spaceCard,
              CardOptionWidget(
                key: const Key(
                  'OnBoardingPage_CardOptionWidget_radioStationCard',
                ),
                responsiveBloc: responsiveBloc,
                urlImage: 'assets/img/pragma_app_astronauta2.png',
                title: 'Emisora',
                onTap: () {},
              ),
              spaceCard,
              CardOptionWidget(
                key: const Key('OnboardingPage_CardOptionWidget_UserCourses'),
                responsiveBloc: responsiveBloc,
                urlImage: 'assets/img/galaxia_crecimiento.png',
                title: 'Crecimiento',
                onTap: () {},
              ),
              spaceCard,
              Stack(
                children: <Widget>[
                  CardOptionWidget(
                    responsiveBloc: responsiveBloc,
                    urlImage: 'assets/img/galaxia_asignacion.png',
                    title: 'Asignación',
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
