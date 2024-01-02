import 'package:flutter/material.dart';
import 'package:food_app/features/auth/widgets/enums.dart';
import 'package:food_app/utils/build_context_extension.dart';

class RegisterUserInfo extends StatelessWidget {
  const RegisterUserInfo({
    super.key,
    required RegisterSection section,
    required TextEditingController usernameController,
    required TextEditingController dateController,
    required TextEditingController sexController,
    required TextEditingController phoneController,
    required TextEditingController emailController,
  }) : _section = section, _usernameController = usernameController, _dateController = dateController, _sexController = sexController, _phoneController = phoneController, _emailController = emailController;

  final RegisterSection _section;
  final TextEditingController _usernameController;
  final TextEditingController _dateController;
  final TextEditingController _sexController;
  final TextEditingController _phoneController;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          _section == RegisterSection.userInfo ? true : false,
      child: SizedBox(
        height: context.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                return null;
              },
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                prefixStyle: TextStyle(),
                hintText: "Username",
                hintStyle: TextStyle(
                  height: 2,
                  color: Color(0xffDDDADA),
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.width * 0.45,
                  child: TextFormField(
                    controller: _dateController,
                    validator: (value) {
                      return null;
                    },
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_month_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      hintText: "Date",
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xffDDDADA),
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: context.width * 0.45,
                  child: TextFormField(
                    controller: _sexController,
                    validator: (value) {
                      return null;
                    },
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.male_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      hintText: "Sex",
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xffDDDADA),
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: _phoneController,
              validator: (value) {
                return null;
              },
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                prefixStyle: TextStyle(),
                hintText: "Phone Number",
                hintStyle: TextStyle(
                  height: 2,
                  color: Color(0xffDDDADA),
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(),
                ),
              ),
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                return null;
              },
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                prefixStyle: TextStyle(),
                hintText: "Email",
                hintStyle: TextStyle(
                  height: 2,
                  color: Color(0xffDDDADA),
                  fontSize: 15,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
