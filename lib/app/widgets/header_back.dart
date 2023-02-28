import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overnites/app/factories/auth_service_factory.dart';
import 'package:overnites/app/util/modal.dart';
import 'package:overnites/auth/widgets/login.dart';
import 'package:overnites/hotel/view/hotel.dart';
import 'package:overnites/user/view/user.dart';

class HeaderBackWidget extends StatefulWidget {
  const HeaderBackWidget({super.key});

  @override
  State<StatefulWidget> createState() => _HeaderBackWidgetState();
}

class _HeaderBackWidgetState extends State<HeaderBackWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            iconSize: 36,
            splashRadius: 36,
            onPressed: () => {Navigator.pop(context)},
            icon: SvgPicture.asset(
              'assets/back-icon.svg',
              height: 128,
              width: 128,
              fit: BoxFit.fill,
            ),
          ),
          const Spacer(),
          IconButton(
            iconSize: 36,
            splashRadius: 36,
            onPressed: () async => {
              if (await (await AuthServiceFactory.make()).isAuthenticated())
                {
                  Navigator.of(context).push(
                    PageRouteBuilder<UserPage>(
                      pageBuilder: (context, animation1, animation2) =>
                          const UserPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  )
                }
              else
                {
                  showModal(
                    context,
                    (context) {
                      return const LoginWidget();
                    },
                  )
                }
            },
            icon: SvgPicture.asset(
              'assets/user.svg',
              height: 128,
              width: 128,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
