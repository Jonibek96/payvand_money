import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payvand_money/home/home_page.dart';
import 'package:payvand_money/utils/dimensions.dart';
import 'package:payvand_money/widget/big_text.dart';
import 'package:payvand_money/widget/small_text.dart';

import '../utils/app_colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late String _confirmPassword;
  bool showLogin = true;
  late bool passwordVisibility1;
  late bool passwordVisibility2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmpasswordController = TextEditingController();
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.all(33),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/group91.png"),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  showLogin
                      ? Column(
                          children: [
                            _form("Sign Up", _buttonAction),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(top: Dimensions.height20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 79,
                                        child: Divider(
                                          color: AppColors.textColor,
                                        )),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    SmallText(text: "or"),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    SizedBox(
                                        width: 79,
                                        height: 5,
                                        child: Divider(
                                          color: AppColors.textColor,
                                        )),
                                  ],
                                )),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Dimensions.width60,
                                    height: Dimensions.height60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/google.png")),
                                        color: Color(0xFFEEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width50,
                                  ),
                                  Container(
                                    width: Dimensions.width60,
                                    height: Dimensions.height60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/facebook.png")),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius50)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmallText(
                                    text: "Already have account?",
                                    size: 14,
                                  ),
                                  TextButton(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: AppColors.mainColor,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: Dimensions.font14),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showLogin = false;
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            _form("Login", _buttonAction),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin:
                                    EdgeInsets.only(top: Dimensions.height20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 79,
                                        child: Divider(
                                          color: AppColors.textColor,
                                        )),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    SmallText(text: "or"),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    SizedBox(
                                        width: 79,
                                        height: 5,
                                        child: Divider(
                                          color: AppColors.textColor,
                                        )),
                                  ],
                                )),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Dimensions.width60,
                                    height: Dimensions.height60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/google.png")),
                                        color: Color(0xFFEEEEEE),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius50)),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width50,
                                  ),
                                  Container(
                                    width: Dimensions.width60,
                                    height: Dimensions.height60,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/facebook.png")),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius50)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SmallText(
                                    text: "Don't have an account?",
                                    size: 14,
                                  ),
                                  TextButton(
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: AppColors.mainColor,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: Dimensions.font14),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showLogin = true;
                                        });
                                      })
                                ],
                              ),
                            )
                          ],
                        )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _form(String label, void func()) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BigText(text: label, size: 40, fontWeight: FontWeight.bold,),
          SizedBox(height: Dimensions.height40,),
          SmallText(text: "Email Address",),
          //_inputEmail('Jonebek@96.gmail.com', _emailController),
          TextFormField(
            validator: (value) => value!.isEmpty ? 'Enter a valid login' : null,
          style: Theme.of(context).textTheme.subtitle2,
          cursorColor: AppColors.mainColor,
          autofocus: false,
          obscureText: false,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Jonebek@96.gmail.com',
            hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFC4C4C4)),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor)),
        ),
      ),
          SizedBox(height: Dimensions.height30,),
          SmallText(text: "Password",),
          TextFormField(
            validator: (value) => value!.length < 8 ? 'Your password be larger than 8 character' : null,
            style: TextStyle(fontSize: 15, color: Colors.black,),
            textAlign: TextAlign.start,
            cursorColor: AppColors.mainColor,
            obscureText: !passwordVisibility1,
            autofocus: false,
            controller: _passwordController,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () =>
                    setState(() => passwordVisibility1 = !passwordVisibility1),
                focusNode: FocusNode(skipTraversal: true),
                child: Icon(
                  passwordVisibility1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Color(0xFF757575),
                  size: 13,
                ),
              ),
              hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC4C4C4)),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor)),
            ),
          ),
          SizedBox(height: Dimensions.height30,),
          SmallText(text: 'Confirm Password'),
          TextField(
            style: TextStyle(fontSize: 15, color: Colors.black,),
            textAlign: TextAlign.start,
            cursorColor: AppColors.mainColor,
            obscureText: !passwordVisibility2,
            autofocus: false,
            controller: _confirmpasswordController,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () =>
                    setState(() => passwordVisibility2 = !passwordVisibility2),
                focusNode: FocusNode(skipTraversal: true),
                child: Icon(
                  passwordVisibility2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Color(0xFF757575),
                  size: 13,
                ),
              ),
              hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC4C4C4)),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.mainColor)),
            ),
          ),
          _button(label, func),
        ],
      ),
    );
  }

  Container _button(String text, void func()) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: Dimensions.height30),
      child: TextButton(
        onPressed: () {
          func();
        },
        child: Container(
            width: 201,
            height: 59,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.2),
                      blurRadius: 60.0,
                      spreadRadius: 60,
                      offset: Offset(0, -50)),
                  BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.2),
                      blurRadius: 60.0,
                      spreadRadius: 60,
                      offset: Offset(0, 50)),
                ]),
            child: Center(
                child: BigText(
              text: text,
              size: 22,
              color: Colors.white,
            ))),
      ),
    );
  }
  void _buttonAction() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _confirmPassword = _confirmpasswordController.text;

    // _emailController.clear();
    // _passwordController.clear();
    // _confirmpasswordController.clear();
    if(_formKey.currentState!.validate()){
      print('hello');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=> HomePage(),
          ));
    }

  }

  Widget _inputEmail(String hintText, TextEditingController controller) {
    return TextField(
      style: Theme.of(context).textTheme.subtitle2,
      cursorColor: AppColors.mainColor,
      autofocus: true,
      obscureText: false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFFC4C4C4)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC4C4C4)),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.mainColor)),
      ),
    );
  }

}
