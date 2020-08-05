import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:ecartapp/assets/theme_colors.dart';
import 'package:ecartapp/model/user.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/cart_provider.dart';
// import '../../common/models/user.dart';
// import '../../providers/auth_provider.dart';

class BottomBar extends StatelessWidget {
  final String currentScreen;

  BottomBar({this.currentScreen});

  @override
  Widget build(BuildContext context) {
    User _currentUser; // = Provider.of<Auth>(context).currentUser;
    // final String _currentLang =
    //     Provider.of<MASAppLocale>(context).currentLocale?.languageCode;
    double deviceH = MediaQuery.of(context).size.height;

    Widget _bottomBarTemplate(List<Widget> children) {
      return Container(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? deviceH * 0.2
            : deviceH * 0.1,
        decoration: BoxDecoration(
          color: bottomBarCustom,
          border: Border(
            top: BorderSide(
              color: borderCustom,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      );
    }

    Widget _iconBottnTemplate(IconData iconData, String lbl, String path,
        {bool selected = false}) {
      return InkWell(
        onTap: () {
          if (!selected) {
            Navigator.pushNamed(context, path);
          }
        },
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Icon(
                  iconData,
                  color: selected ? primaryColorLightCustom : Colors.grey,
                  size: 20.0,
                  semanticLabel: lbl,
                ),
              ),
            ),
            Flexible(
              child: AutoSizeText(
                lbl,
                style: TextStyle(
                  fontSize: 10.0,
                  color: selected ? primaryColorLightCustom : Colors.grey,
                  // height: 0.9,
                ),
                maxLines: 1,
              ),
            )
          ],
        ),
      );
    }

    Widget _buildBottomBarLogedin() {
      return _bottomBarTemplate([
        //   _iconBottnTemplate(
        //       Icons.home, AppLocalizations.of(context).lblHome, '/HomeScreen'),
        //   _iconBottnTemplate(Icons.message,
        //       AppLocalizations.of(context).lblMyRequests, '/myrequests',
        //       selected:
        //           currentScreen == AppLocalizations.of(context).lblMyRequests),
        //   _iconBottnTemplate(Icons.local_library,
        //       AppLocalizations.of(context).lblPurchaseHistory, '/purchasehistory',
        //       selected: currentScreen ==
        //           AppLocalizations.of(context).lblPurchaseHistory),
        //   Consumer<Cart>(
        //     builder: (ctx, cartProvider, _) => Badge(
        //       // elevation: 0,
        //       // padding: EdgeInsets.all(0),
        //       animationType: BadgeAnimationType.fade,
        //       position: BadgePosition.topRight(
        //         top: 0.0,
        //         //right: _currentLang == 'ar' ? 10.0 : -10.0,
        //       ),
        //       badgeContent: Text(
        //         cartProvider.myCart != null
        //             ? cartProvider.myCart.totalUnits.toString()
        //             : '',
        //         style: TextStyle(color: Colors.white, fontSize: 10.0),
        //       ),
        //       badgeColor: Colors.red,
        //     //   child: Container(
        //     //     height: double.maxFinite,
        //     //     child: _iconBottnTemplate(Icons.shopping_cart,
        //     //         //AppLocalizations.of(context).lblCart, '/cart',
        //     //        // selected:
        //     //           //  currentScreen == AppLocalizations.of(context).lblCart),
        //     //   ),
        //     // ),
        //   ),
      ]);
    }

    Widget _buildBottomBarLogedout() {
      return _bottomBarTemplate([
        // _iconBottnTemplate(
        //     Icons.home, AppLocalizations.of(context).lblHome, '/HomeScreen'),
        // _iconBottnTemplate(Icons.fingerprint,
        //     AppLocalizations.of(context).lblSignIn, '/login'),
      ]);
    }

    return _currentUser != null
        ? _buildBottomBarLogedin()
        : _buildBottomBarLogedout();
  }
}
