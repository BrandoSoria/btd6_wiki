import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../services/services.dart';
import '../ui/ui.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: AuthBackground(
        //SingleChildScrollView para pantalla desplazable por informacion larga
        body: Container(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50), // Espacio adicional antes de la imagen
          Image.asset(
            'assets/ninja_kiwi.png', // Cambia 'tu_imagen.png' al nombre de tu imagen
            height: 100, // Ajusta la altura según tus necesidades
            width: 100, // Ajusta el ancho según tus necesidades
          ),
          SizedBox(height: 10),
          const SizedBox(height: 50),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Text('Login', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
          const SizedBox(height: 50),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'register'),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      Colors.redAccent.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: const Text(
                'Crear una nueva cuenta',
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 253, 253, 253)),
              )),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Ingresa Tu Correo Aqui',
                labelText: 'Correo electrónico',
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            const SizedBox(height: 10),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical()),
                disabledColor: Color.fromARGB(255, 255, 255, 255),
                elevation: 0,
                color: Color.fromARGB(211, 216, 33, 49),
                child: Container(
                    padding: EdgeInsets.all(33),
                    child: Text(
                      loginForm.isLoading ? 'Espere' : 'Ingresar',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    )),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        // TODO: validar si el login es correcto
                        final String? errorMessage = await authService.login(
                            loginForm.email, loginForm.password);

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          // TODO: mostrar error en pantalla
                          // print( errorMessage );
                          NotificationsService.showSnackbar(errorMessage);
                          loginForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}
