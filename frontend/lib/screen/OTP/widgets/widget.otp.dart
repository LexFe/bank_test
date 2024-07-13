import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/screen/OTP/widgets/controller.otp.dart';
import 'package:login/theme/app_color.dart';

Widget buildBodyOTP(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: const ClampingScrollPhysics(),
    children: [
      _buildBackGroundOTP(context),
      _buildHorizontalTimelineOTP(),
      _buildContainerOTP(context),
      SizedBox(height: 0.355.sh),
      _buildButtonOTP(context)
    ],
  );
}

Widget _buildBackGroundOTP(BuildContext context) {
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
            'ยืนยันรหัส OTP',
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

Widget _buildHorizontalTimelineOTP() {
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
    ],
  );
}

Widget _buildContainerOTP(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '''
กรุณากรอกรหัส OTP 4 หลักที่ท่านได้รับทาง SMS
ระบบได้ส่ง OTP ไปทาง SMS ที่เบอร์ 0988***885
''',
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColor.textBlack,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          _buildOtpTextField(context),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () => debugPrint('Resend OTP'),
            child: Text(
              'ขอรหัสผ่านใหม่',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.textBlack,
                decoration: TextDecoration.underline,
                // i want underline this text
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}

Widget _buildButtonOTP(BuildContext context) {
  return GestureDetector(
    onTap: () {
      OTPController(context: context).hadleOTP();
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

Widget _buildOtpTextField(BuildContext context) {
  return OtpTextField(
    numberOfFields: 4,
    borderRadius: BorderRadius.circular(10.r),
    borderWidth: 5.w,
    enabledBorderColor: AppColor.textHintStyle,
    focusedBorderColor: AppColor.primaryColor,
    cursorColor: AppColor.primaryColor,
    fieldWidth: 0.13.sw,
    fieldHeight: 0.13.sw,
    showFieldAsBox: true,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
    ],
    onCodeChanged: (String code) {
      //handle validation or checks here
    },
    //runs when every textfield is filled
    onSubmit: (String verificationCode) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Verification Code"),
              content: Text('Code entered is $verificationCode'),
            );
          });
    }, // end onSubmit
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
