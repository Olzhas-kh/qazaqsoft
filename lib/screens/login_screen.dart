import 'package:flutter/material.dart';
import 'package:test_app/screens/users_list_screen.dart';
import 'package:test_app/utils/clip_path_login.dart';
import 'package:test_app/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {setState(() {
      
    });});
    _passwordController.addListener(() {setState(() {
      
    }); });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 225),
      body: 
        
        Stack(
          
          children: [
            ClipPath(
              clipper: LoginClipPath(),
              child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              
              
              child: Image.asset("assets/images/back_image.png", fit: BoxFit.cover,),
                      ),
            ),
           Container(
              
              padding: const EdgeInsets.all(16.0),
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Вход",
                    style: TextStyle(
                        color: ColorStyle.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(25)),
                        color: ColorStyle.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          controller: _emailController,
                          cursorColor: ColorStyle.loginButtonColor,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.auto,
          
                            floatingLabelStyle:
                                TextStyle(color: ColorStyle.loginButtonColor),
                            fillColor: ColorStyle.white,
                            filled: true,
                            labelText: "Email",
                            contentPadding: const EdgeInsets.all(0),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorStyle.backgroundGreyColor,),),
                            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 132, 132, 132),),),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 83,
                        ),
                        TextField(
                          controller: _passwordController,
                          cursorColor: ColorStyle.loginButtonColor,
                          decoration: InputDecoration(
                            floatingLabelStyle:
                                TextStyle(color: ColorStyle.loginButtonColor),
                            fillColor: ColorStyle.white,
                            filled: true,
                            labelText: "Пороль",
                            contentPadding: const EdgeInsets.all(0),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorStyle.backgroundGreyColor,),),
                            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 132, 132, 132),),),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 63,
                        ),
                        InkWell(
                          onTap: (){
                            if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const UsersList()));
                            }else{
          
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty?  ColorStyle.loginButtonColor.withOpacity(1):ColorStyle.loginButtonColor.withOpacity(0.60)
                                
                                ),
                            child: Center(
                              child: Text(
                                "Войти",
                                style: TextStyle(
                                    color: _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty?  ColorStyle.white.withOpacity(1):ColorStyle.white.withOpacity(0.90),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      
    );
  }
}
