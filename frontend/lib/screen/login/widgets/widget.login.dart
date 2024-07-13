import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/login/bloc/login_bloc.dart';
import 'package:login/screen/login/widgets/controller.login.dart';
import 'package:login/theme/app_color.dart';

Widget buildBodyLogin(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildLoginTextLogin(),
      _buildLoginTextSecornLogin(),
      SizedBox(height: 50.h),
      _buildEmaiLogin(),
      SizedBox(height: 10.h),
      _buildPasswordLogin(),
      SizedBox(height: 100.h),
      _buildButtonLogin(context),
      SizedBox(height: 50.h),
      _buildRegisterTextLogin(context)
    ],
  );
}

Widget _buildLoginTextLogin() {
  return Text(
    'Login',
    style: TextStyle(
      color: Colors.white,
      fontSize: 50.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _buildLoginTextSecornLogin() {
  return Text(
    'Sign in to continue.',
    style: TextStyle(
      color: Colors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget _buildEmaiLogin() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'EMAIL',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.0.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 60.h,
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: AppColor.textBlack,
                ),
                onChanged: (value) {
                  context
                      .read<LoginBloc>()
                      .add(LoginUsernameChangingEvent(value));
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: 'Enter your Email',
                  hintStyle: const TextStyle(
                    color: AppColor.textHintStyle,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildPasswordLogin() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'PASSWORD',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.0.h),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 60.h,
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                obscuringCharacter: '*',
                style: const TextStyle(
                  color: AppColor.textBlack,
                ),
                onChanged: (value) {
                  context
                      .read<LoginBloc>()
                      .add(LoginPasswordChangingEvent(value));
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.w),
                  hintText: 'Enter your Password',
                  hintStyle: const TextStyle(
                    color: AppColor.textHintStyle,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildButtonLogin(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 70.w, right: 70.w),
    child: GestureDetector(
      onTap: () {
        LoginController(context: context).hadleLogin();
      },
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.buttonLogin,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildRegisterTextLogin(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Don\'t have an account?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(width: 5.w),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.REGISTER);
        },
        child: Text(
          'Register',
          style: TextStyle(
            color: AppColor.buttonLogin,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

class BackgroundBorderClipperSecornLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.94;
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
  bool shouldReclip(BackgroundBorderClipperSecornLogin oldClipper) =>
      oldClipper != this;
}

class BackgroundBorderClipperLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height;
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
  bool shouldReclip(BackgroundBorderClipperLogin oldClipper) =>
      oldClipper != this;
}
