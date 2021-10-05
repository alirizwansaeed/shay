import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shay/presentation/common_widgets/common_widgets.dart';
import 'package:shay/presentation/pages/login/widgets/social_auth.dart';

class MobileLogin extends StatelessWidget {
  const MobileLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF120C32).withGreen(50),
              Color(0xFF120C32),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Welcome',
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(' Back',
                      style: GoogleFonts.nunito(
                        color: Colors.white.withOpacity(.6),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SocialAuth(),
              SizedBox(
                height: 30,
              ),
              FormBuilderTextField(
                style: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                name: "email",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.email(context)
                ]),
                decoration: formFieldDecoration.copyWith(
                  hintText: "Enter Your Email",
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.white.withOpacity(.5),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Color(0xFF120C32).withGreen(50),
                ),
              ),
              SizedBox(height: 20),
              FormBuilderTextField(
                name: "email",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.email(context)
                ]),
                decoration: formFieldDecoration.copyWith(
                  hintText: "Enter Your Password",
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.white.withOpacity(.5),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Color(0xFF120C32).withGreen(50),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.nunito(
                        color: Colors.white.withOpacity(.5),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
