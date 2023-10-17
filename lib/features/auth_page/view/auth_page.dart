import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:know_your_game/utils/utils.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KygContainer(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                          color: ColorsUiTheme.mainTextColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 14.0,
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                            gapPadding: 1,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Username',
                          isDense: true,
                          contentPadding: EdgeInsets.all(4),
                        ),
                      ),
                    ),
                    KygButton(
                      onTap: () {
                        context.go(RoutesEndpoints.main);
                      },
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: ColorsUiTheme.mainGreen,
                      borderColor: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: ColorsUiTheme.shadowGreen,
                          offset: const Offset(0.0, 3.0),
                        )
                      ],
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
