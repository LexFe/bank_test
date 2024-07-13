import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/common/values/constant.dart';
import 'package:login/global.dart';
import 'package:login/screen/home/widgets/widget.home.dart';
import 'package:login/theme/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColor.white,
                size: 40.sp,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: AppColor.primaryColor,
        title: Row(
          children: [
            Text(
              'LogisticPro',
              style: TextStyle(
                color: AppColor.white,
                fontSize: 24.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5.w),
            Icon(
              Icons.local_shipping_outlined,
              color: AppColor.white,
              size: 30.sp,
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.account_circle_rounded,
            color: AppColor.white,
            size: 34.sp,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Apisit Yimboa',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 80.w,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 171, 0),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  'Shipping',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 24.sp,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_pin),
              title: Text('Location'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationPage()));
                // Add navigation code here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Add navigation code here
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Global.userService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (route) => false);
                // Add logout code here
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          buildSlideImgHome(),
          buildMainMenuHome(),
          buildOrderHome(),
          buildNewsHome()
        ],
      ),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Text('Location Page'),
      ),
    ));
  }
}
