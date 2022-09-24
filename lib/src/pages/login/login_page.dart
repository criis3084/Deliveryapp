import 'package:delivery/src/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  //llamamiento de los controller
  LoginController controlerlogin = Get.put(LoginController());

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiglDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(//posiciona un elemento encima de otro
       children: [
        _backgroundCover1(context),
         _backgroundCover2(context),
          _boxForm(context),
         Column(//posicionar elemento uno debajo de otro de manera vertical en este caso posicionar la imagen y el texto
           children: [
             _imageCover(),
             _texAppName()
           ],
         )

       ],

      )
    );
  }

  Widget _backgroundCover1(BuildContext context) {
    return Positioned(

        right: -getSmallDiameter(context) / 3,
        top: -getSmallDiameter(context) / 3,
        child: Container(
          width: getSmallDiameter(context),
          height: getSmallDiameter(context),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFFeb8300), Color(0xFFffaf46)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),

    );
  }
  Widget _backgroundCover2(BuildContext context){
    return  Positioned(
      left: -getBiglDiameter(context) / 4,
      top: -getBiglDiameter(context) / 4,
      child: Container(
        child: const Center(

        ),
        width: getBiglDiameter(context),
        height: getBiglDiameter(context),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color(0xFFff950e), Color(0xFFffcb5c)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }

  Widget _texAppName(){
  return Text(
    'Toto Trip',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black
    ),
  );
  }
  // funcion o windget para crear la caja de contenido donde ira lo que el ingreso
  // de correo y contraseña

  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.45,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.48,left:50,right: 50 ),
      decoration: BoxDecoration(
        color: Colors.white ,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0,0.75)
          )
        ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin()

          ],

        ),
      ),

    );

  }
//boton ingresar o buton login
  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric( vertical: 15)
          ),
          child: Text(
            'Ingresar',
            style: TextStyle(
              color: Colors.black
            ),
          )
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          prefixIcon: Icon(Icons.email)
        ),
      ),
    );

  }
  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );

  }
  
  Widget _textYourInfo(){
    return Container(
      margin: EdgeInsets.only(top:40,bottom: 45),
      child: Text(
        "INGRESA ESTA INFORMACION",
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }

//texto no tienes cuenta registrate
  Widget _textDontHaveAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17
          ),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: ()=> controlerlogin.goToRegisterPage(),
          child: Text('Registrate Aqui',
          style: TextStyle(
          color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 17
          )
          ),
        ),

      ],
    );
  }

  Widget _imageCover(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top:90,bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
        'assets/img/portada.jpg',
          width: 180,
          height: 180,
        ),
      ),
    );
  }


}
