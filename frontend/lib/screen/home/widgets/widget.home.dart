import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/theme/app_color.dart';

int active = 0;
List<String> items = ['การจองของฉัน', 'ชำระเงิน', "ติดตาม", "สถานะวิธีใช้งาน"];
List<String> thucks = [
  '4 ล้อ',
  '6 ล้อ',
  "10 ล้อ",
  "เทรลเลอร์",
  "ลากตู้",
  "รถพ่วง"
];
Widget buildSlideImgHome() {
  return Container(
    padding: EdgeInsets.all(30.h),
    height: 250.h,
    width: double.infinity,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
    child: CarouselSlider(
      options: CarouselOptions(
          enableInfiniteScroll: false,
          autoPlay: true,
          onPageChanged: (index, reson) {
            active = index;
          },
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 5)),
      items: List.generate(3, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            image: DecorationImage(
              image: AssetImage('assets/images/slide${index + 1} copy.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildMainMenuHome() {
  return Container(
    padding: EdgeInsets.all(20.h),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'เมนูหลัก',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(
              Icons.menu_rounded,
              color: const Color.fromARGB(255, 111, 0, 130),
              size: 40.sp,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 0.035.sw),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: const Color.fromARGB(99, 0, 119, 170),
                      child: Image.asset(
                        'assets/icons/${index + 1}.png',
                        width: 45.w,
                        height: 45.h,
                      ),
                    ),
                    Text(
                      items[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildOrderHome() {
  return Container(
    padding: EdgeInsets.all(20.h),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'วันนี้จองอะไรดี',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            Icon(
              Icons.menu_rounded,
              color: const Color.fromARGB(255, 111, 0, 130),
              size: 40.sp,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 0.23.sh,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1.2,
            ),
            itemCount: thucks.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 0.2.sw,
                    height: 0.08.sh,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Icon(
                      Icons.local_shipping,
                      color: AppColor.white,
                      size: 40.sp,
                    ),
                  ),
                  Text(
                    thucks[index],
                    style: TextStyle(
                      color: AppColor.textBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildNewsHome() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'ข่าวสาร',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'ดูทั้งหมด',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      buildSlideImgHome(),
    ],
  );
}
