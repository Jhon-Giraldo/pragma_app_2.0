import 'package:flutter/material.dart';

import '../../../../blocs/bloc_responsive.dart';
import '../../../../blocs/navigator_bloc.dart';
import '../../../../ui/widgets/responsive/basic_components/basic_3_x_1_widget.dart';

class BasicProfileWidget extends StatelessWidget {
  const BasicProfileWidget({
    required this.responsiveBloc,
    required this.navigatorBloc,
    super.key,
  });

  final ResponsiveBloc responsiveBloc;
  final NavigatorBloc navigatorBloc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //navigatorBloc.pushNamed(ProfileModule.name);
      },
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Basic3x1Widget(
              numberOfColumns: 4,
              responsiveBloc: responsiveBloc,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'User name',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'User Seniority',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 130,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      offset: const Offset(0, 5),
                      blurRadius: 20.0,
                    ),
                  ],),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.purple[900],
                child: const Text(
                  'Image',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
