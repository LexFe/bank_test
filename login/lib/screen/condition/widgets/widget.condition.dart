import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/screen/condition/bloc/condition_bloc.dart';
import 'package:login/screen/condition/widgets/controller.condition.dart';
import 'package:login/theme/app_color.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

Widget buildBodyCondition(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: const ClampingScrollPhysics(),
    children: [
      _buildBackGroundCondition(context),
      _buildHorizontalTimelineCondition(),
      _buildContainerInfoCondition(),
      _buildButtonCondition(context),
    ],
  );
}

Widget _buildBackGroundCondition(BuildContext context) {
  return Stack(
    children: [
      ClipPath(
        clipper: BackgroundBorderClipper(),
        child: Container(
          width: double.infinity,
          height: 250.h,
          decoration: const BoxDecoration(color: AppColor.primaryColor),
        ),
      ),
      Positioned(
        right: 0,
        child: ClipPath(
          clipper: BackgroundYellowClipper(),
          child: Container(
            width: 230.h,
            height: 120.h,
            decoration: const BoxDecoration(color: AppColor.buttonLogin),
          ),
        ),
      ),
      Positioned(
        left: 20.w,
        right: 0.w,
        top: 50.h,
        child: SizedBox(
          height: 56.0.h, // Adjust the height to fit your needs
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.sp, // Adjust size according to your needs
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 0.w,
        right: 0.w,
        top: 280 / 2.5.h,
        child: Center(
          child: Text(
            'เงื่อนไขการใช้บริการ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildHorizontalTimelineCondition() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 25.h,
        height: 25.h,
        decoration: BoxDecoration(
          color: AppColor.blackGround,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(360.r),
        ),
      ),
      Container(
        width: 120.w,
        height: 4.h,
        color: AppColor.primaryColor,
      ),
      Container(
        width: 25.h,
        height: 25.h,
        decoration: BoxDecoration(
          color: AppColor.blackGround,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(360.r),
        ),
        child: Container(
          width: 20.h,
          height: 20.h,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            border: Border.all(
              color: AppColor.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(360.r),
          ),
        ),
      ),
      Container(
        width: 120.w,
        height: 4.h,
        color: AppColor.primaryColor,
      ),
      Container(
        width: 25.h,
        height: 25.h,
        decoration: BoxDecoration(
          color: AppColor.blackGround,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(360.r),
        ),
      ),
    ],
  );
}

Widget _buildContainerInfoCondition() {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 0.7.w,
      ),
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('''
เงื่อนไข
1.
2.
3.
4.
5.
6.
7.
8.
9.
10.

นโยบายการจัดการข้อมูลส่วนบุคคล
1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
''',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ConditionBloc, ConditionState>(
                builder: (context, state) {
                  return MSHCheckbox(
                    size: 24,
                    value: state.isAgree,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: AppColor.primaryColor,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {
                      context
                          .read<ConditionBloc>()
                          .add(ConditionAgreeChanged(isAgree: selected));
                    },
                  );
                },
              ),
              SizedBox(width: 10.w),
              Text(
                'ยอมรับเงื่อนไขและนโยบายทั้งหมด',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _buildButtonCondition(BuildContext context) {
  return GestureDetector(
    onTap: () {
      ConditionController(context: context).hadleCondition();
    },
    child: Container(
      height: 60.h,
      width: double.infinity,
      margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(
          'ถัดไป',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

class BackgroundYellowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.5, size.height);
    final endPoint = Offset(size.width, size.height / 1.5);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundYellowClipper oldClipper) => oldClipper != this;
}

class BackgroundBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.75;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.5, size.height);
    final endPoint = Offset(size.width, size.height * 0.75);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundBorderClipper oldClipper) => oldClipper != this;
}
