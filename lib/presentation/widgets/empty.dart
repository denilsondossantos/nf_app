import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Empty extends StatelessWidget {
  final String? textWorning;
  const Empty({Key? key, this.textWorning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Lottie.asset('assets/lottie/empty.json', fit: BoxFit.contain),
          textWorning != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.9,
                      child: Text(
                        textWorning ?? '',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.color
                                  ?.withOpacity(0.8),
                            ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
