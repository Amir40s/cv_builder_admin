import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../helper/text_widget.dart';
import '../../provider/data_provider.dart';
import '../route/routes.dart';
import 'drawer_list_tile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const DrawerHeader(
              // child: Image.asset("assets/images/logo.png"),
              child: Center(
                  child: Text(
                "CV Builder",
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: TextWidget(text: "Main",size: 12.0,color: Colors.black,isBold: true,),
            ),
            Consumer<DataProvider>(
              builder: (context, data, child) {
                data.fetchCountValue();
                return DrawerListTile(
                  index: 0,
                  screenIndex: Routes.DASHBOARD_ROUTE,
                  title: "Category (${data.newMessage.toString()})",
                  svgSrc: DASHBOARD_SVG,
                );
              }
            ),

            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(
              height: defaultDrawerHeadHeight,
            ),
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: TextWidget(text: "Templates",size: 14.0,color: Colors.black,isBold: true,)
            ),
            const SizedBox(
              height: defaultDrawerHeadHeight - 5,
            ),
            Consumer<DataProvider>(
                builder: (context, data, child) {
                  data.fetchCountValue2();
                  return DrawerListTile(
                    index: 1,
                    screenIndex: Routes.PENDING_MESSAGES,
                    title: "Templates (${data.pendingMessage.toString()})",
                    svgSrc: DASHBOARD_SVG,
                  );
                }
            ),

            const Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            // const SizedBox(
            //   height: defaultDrawerHeadHeight,
            // ),
            // Padding(
            //     padding: const EdgeInsets.only(left: defaultPadding),
            //     child: TextWidget(text: "Complete Messages",size: 14.0,color: Colors.black,isBold: true,)
            // ),
            // const SizedBox(
            //   height: defaultDrawerHeadHeight - 5,
            // ),
            // const DrawerListTile(
            //   index: 2,
            //   screenIndex: Routes.COMPLETE_MESSAGE,
            //   title: "Complete Messages",
            //   svgSrc: DASHBOARD_SVG,
            // ),




            // const DrawerListTile(
            //   index: 9,
            //   screenIndex: 9,
            //   title: "P. History",
            //   svgSrc: "assets/icons/menu_dashboard.svg",
            // ),

            // const DrawerListTile(
            //   index: 10,
            //   screenIndex: 10,
            //   title: "P. Returns",
            //   svgSrc: "assets/icons/menu_dashboard.svg",
            // ),

            // DrawerListTile(
            //   index: 11,
            //   screenIndex: 11,
            //   title: "P. Returns History",
            //   svgSrc: "assets/icons/menu_dashboard.svg",
            // ),

            //Sale LIST
            // const Divider(
            //   thickness: 0.5,
            //   color: Colors.black,
            // ),

          ],
        ),
      ),

    );
  }
}
