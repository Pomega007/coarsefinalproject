import 'package:coarse_final_project/Config/GoogleSignInProvider.dart';
import 'package:coarse_final_project/Config/SharedPrefrences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:coarse_final_project/Config/Model/UserProvider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  String name = '';
  Map? _userData;

  final User = UserID.getUser();
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    initState();
    _chechIfisLoggedIn();
    // name = UserSharedPrefrences.getUsername() ?? '';
  }

  _chechIfisLoggedIn()async{
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if(accessToken!=null){
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }else{
      _login();
    }
  }

  _login()async{
    final LoginResult result = await FacebookAuth.instance.login();

    if(result.status == LoginStatus.success) {
      _accessToken == result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
    }else{
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
  }


  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Pattern.png'),
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Divider(height: 20,
            color: Colors.transparent,
            ),
            Container(
              child: Image.asset('assets/Full Logo.png'),
              height: 200,
            ),

            Divider(height: 50,
              color: Colors.transparent,
            ),

            Text('Login To Your Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),

            Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 30,
                left: 30,
                top:  30,
              ),
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  } else if (value.length < 4) {
                    return 'at least enter 4 characters';
                  } else if (value.length > 13) {
                    return 'maximum character is 13';
                  }
                  return null;
                },
                ),
            ),
            ),

            Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 30,
              ),

              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  label: Text('Password'),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your email';
                  } else if (value.length < 4) {
                    return 'at least enter 4 characters';
                  } else if (value.length > 13) {
                    return 'maximum character is 13';
                  }
                  return null;
                },
              ),
            ),
      ),

            Divider(
              height: 30,
              color: Colors.transparent,
            ),
            
            Text('Or Continue With',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            ),

            Flexible(
              child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child:ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onSurface: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
                onPressed: () {
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
              label: Text('Google',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              ),
              icon: ImageIcon(
                  AssetImage('assets/google-icon.png'),
              ),
            ),
              ),
            ),

            Flexible(
              child: Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () async {
                            final result = await FacebookAuth.i.login(
                                permissions: ['PublicProfile', 'email']
                            );
                            if (result.status == LoginStatus.success) {
                              final requestData = await FacebookAuth.i.getUserData(
                                fields: 'email, name',
                              );
                              setState(() {
                                _userData = requestData;
                              });
                            }
                          }, icon: Icon(Icons.facebook,
                        color: Colors.blue,
                        ),
                          label: Text('Facebook',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ),

            ElevatedButton(onPressed: () async{
            },
                child: Text('')
            ),
          ],
        ),
      ),
    ),
  );
}
