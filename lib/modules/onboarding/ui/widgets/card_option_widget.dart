import 'package:flutter/material.dart';

import '../../../../blocs/bloc_responsive.dart';
import '../../../../ui/widgets/responsive/basic_components/basic_3_x_1_widget.dart';

class CardOptionWidget extends StatelessWidget {
  const CardOptionWidget({
    required this.responsiveBloc,
    required this.onTap,
    required this.title,
    required this.urlImage,
    super.key,
  });

  final ResponsiveBloc responsiveBloc;
  final VoidCallback onTap;
  final String title;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 2,
            top: -10,
            child: Image.asset(
              urlImage,
              height: 155,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Basic3x1Widget(
              numberOfColumns: 4,
              responsiveBloc: responsiveBloc,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
