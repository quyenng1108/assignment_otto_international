import 'package:assignment_otto_international/src/constants.dart';
import 'package:assignment_otto_international/src/responsive_layout_builder.dart';
import 'package:assignment_otto_international/src/routes.dart';
import 'package:assignment_otto_international/src/state/authentication_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../widgets/ripple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveLayoutBuilder(builder: (context, layout) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Login Screen",
            style: titleStyle.copyWith(color: Colors.white),
          ),
        ),
        body: Center(
          child: Selector<AuthenticationState, bool>(
              selector: (_, state) => state.isLoading,
              builder: (context, isLoading, child) {
                return _buildSignInButton(context, layout, screenWidth,
                    isLoading: isLoading);
              }),
        ),
      );
    });
  }

  Ripple _buildSignInButton(
      BuildContext context, LayoutType layout, double screenWidth,
      {bool isLoading = false}) {
    return Ripple(
      onTap: () async {
        final navigator = Navigator.of(context);
        bool signedIn =
            await context.read<AuthenticationState>().signInWithGoogle();
        if (!signedIn) return;
        navigator.pushReplacementNamed(RoutePath.homeScreen);
      },
      radius: 48,
      child: Transform.scale(
        scale: (layout == LayoutType.desktop || layout == LayoutType.tablet)
            ? 2
            : 1,
        child: Container(
          width: screenWidth * 0.7,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.6),
                offset: const Offset(2, 2),
                blurRadius: 2,
                spreadRadius: 3)
          ]),
          child: Row(
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: SvgPicture.asset(
                  kIsWeb ? icGoogleWeb : icGoogle,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: isLoading
                      ? const SizedBox(
                          height: 48,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        )
                      : const Text(
                          "Sign in with Google",
                          style: titleStyle,
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
