import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dwm2/view/firebase_helper.dart';
import 'package:dwm2/view/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await statusLogin();
  runApp(GetMaterialApp(getPages: [
    GetPage(name: '/', page: () => Login()),
    GetPage(name: '/cadastro', page: () => Cadastro()),
    GetPage(name: '/tela1', page: () => const Tela1()),
  ]));
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Meu App'),
      ),
      body: Center(
        child: Column(children: [
          const Text('Tela'),
          ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text("Sair"))
        ]),
      ),
    ));
  }
}

class Login extends StatelessWidget {
  Login({super.key});

  var estilo = const TextStyle(fontSize: 24);
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: const InputDecoration(labelText: "E-mail"),
                controller: email),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: const InputDecoration(labelText: "Senha"),
                controller: senha),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                //width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      login(email.text, senha.text);
                    },
                    child: Text(
                      "Cadastrar",
                      style: estilo,
                    ))),
          ),
          OutlinedButton(
              onPressed: () {
                Get.toNamed('/cadastro');
              },
              child: const Text("Criar conta")),
          OutlinedButton(
              onPressed: () {
                resetPassword(email: email.text);
              },
              child: const Text("Esqueci a senha"))
        ]),
      ),
    ));
  }
}

class Cadastro extends StatelessWidget {
  Cadastro({super.key});

  var estilo = const TextStyle(fontSize: 24);
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.back_hand)),
            const Text('Criar conta'),
          ],
        ),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: const InputDecoration(labelText: "E-mail"),
                controller: email),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: const InputDecoration(labelText: "Senha"),
                controller: senha),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      criarConta(email.text, senha.text);
                    },
                    child: Text(
                      "Entrar",
                      style: estilo,
                    ))),
          ),
        ]),
      ),
    ));
  }
}