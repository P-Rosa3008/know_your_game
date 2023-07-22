import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:know_your_game/features/entry_page/widgets/language_picker.dart';
import 'package:know_your_game/features/entry_page/widgets/vip_icon_button.dart';
import 'package:know_your_game/utils/utils.dart';
import 'package:know_your_game/utils/widgets/app_bar.dart';

class EntryPage extends StatefulWidget {
  final Widget child;
  const EntryPage({required this.child, super.key});

  @override
  State<EntryPage> createState() => EntryPageState();
}

class EntryPageState extends State<EntryPage> {
  Widget get _child => widget.child;
  final List<BottomNavigationBarItem> _icons = [
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/main_icon.png",
        height: 40.0,
      ),
      label: "main",
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        "assets/profile_icon.png",
        height: 40.0,
      ),
      label: "main",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _calculateSelectedIndex(BuildContext context) {
      final String location = GoRouterState.of(context).location;
      if (location.startsWith(RoutesEndpoints.main)) {
        return 0;
      }
      if (location.startsWith(RoutesEndpoints.profile)) {
        return 1;
      }
      return 0;
    }

    void _onItemTapped(int index, BuildContext context) {
      switch (index) {
        case 0:
          GoRouter.of(context).go(RoutesEndpoints.main);
          break;
        case 1:
          GoRouter.of(context).go(RoutesEndpoints.profile);
          break;
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        actions: [
          VipIconButton(),
        ],
        leadingWidget: LanguagePicker(),
      ),
      body: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 65,
          child: Container(
            padding: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: ColorsUiTheme.mainBorder, width: 2.0),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              items: _icons,
              iconSize: 24.0,
              selectedFontSize: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: _calculateSelectedIndex(context),
              onTap: (int idx) => _onItemTapped(idx, context),
            ),
          ),
        ),
        body: _child,
      ),
    );
  }
}
