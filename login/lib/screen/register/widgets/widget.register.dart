import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login/screen/register/bloc/register_bloc.dart';
import 'package:login/screen/register/widgets/controller.register.dart';
import 'package:login/theme/app_color.dart';

Widget buildBodyRegister(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildContainerInfoRegister(),
      _buildContainerCreatePasswordRegister(),
      _buildButtonRegister(context)
    ],
  );
}

Widget _buildContainerInfoRegister() {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w),
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
        children: [
          Row(
            children: [
              Expanded(
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return _buildTextFieldRegister(
                      hintText: 'name',
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(RegisterNameChanged(name: value));
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: 10.w), // Add spacing between the text fields
              Expanded(
                child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return _buildTextFieldRegister(
                      hintText: 'last name',
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(RegisterSurnameChanged(surname: value));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return _buildTextFieldRegister(
                hintText: 'email',
                onChanged: (value) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterUsernameChanged(username: value));
                },
              );
            },
          ),
          SizedBox(height: 15.h),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return _buildTextFieldRegister(
                hintText: 'tel',
                onChanged: (value) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterPhoneChanged(phone: value));
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

Widget _buildContainerCreatePasswordRegister() {
  return Container(
    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
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
          SizedBox(height: 10.h),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return _buildTextFieldRegister(
                hintText: 'password',
                onChanged: (value) {
                  context
                      .read<RegisterBloc>()
                      .add(RegisterPasswordChanged(password: value));
                },
              );
            },
          ),
          SizedBox(height: 15.h),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return _buildTextFieldRegister(
                hintText: 'confirm password',
                onChanged: (value) {
                  context.read<RegisterBloc>().add(
                      RegisterPasswordConfirmChanged(passwordConfirm: value));
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

Widget _buildButtonRegister(BuildContext context) {
  return GestureDetector(
    onTap: () {
      RegisterController(context: context).hadleRegister();
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
          'Next',
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

Widget _buildTextFieldRegister({
  required String hintText,
  required void Function(String) onChanged,
}) {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(20.r),
    ),
    height: 60.h,
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: AppColor.textBlack, fontSize: 18.sp),
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 15.w),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textHintStyle,
        ),
      ),
    ),
  );
}
