import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../helper/text_widget.dart';
import '../../provider/data_provider.dart';
import '../controller/MenuAppController.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: context.read<MenuAppController>().controlMenu,
            ),
          if (!Responsive.isMobile(context))
            TextWidget(text: "Dashboard", color: Colors.black, size: 20.0, isBold: true),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
          const NotificationCard()
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Consumer<DataProvider>(
       builder: (context, provider,child){
         return Container(
             margin: const EdgeInsets.only(left: defaultPadding),
             padding: const EdgeInsets.symmetric(
               horizontal: defaultPadding,
               vertical: defaultPadding / 2,
             ),
             decoration: BoxDecoration(
               color: primaryColor,
               borderRadius: const BorderRadius.all(Radius.circular(10)),
               border: Border.all(color: Colors.white10),
             ),
             child: Stack(
               children: [
                 Positioned(
                     top: 120,
                     child: TextWidget(text: "12", color: Colors.black, size: 12.0, isBold: true)),
                 const Icon(Icons.notifications,color: Colors.black,)
               ],
             )
         );
       },
      ),
    );
  }
}

