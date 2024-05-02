// ignore_for_file: must_be_immutable
import 'package:dwm2/model/model_data.dart';
import 'package:dwm2/controller/controller_data.dart';
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
    GetPage(name: '/recuperarSenha', page: () => ResetPassword()),
    GetPage(name: '/tela1', page: () => const Tela1()),
    GetPage(name: '/tela2', page: () => const Tela2()),
    GetPage(name: '/tela3', page: () => const Tela3()),
  ]));
}

class Tela1 extends StatelessWidget {
  const Tela1({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ModelData());
    Get.put(ControllerData());
    var dataController = Get.find<ControllerData>();
    return MaterialApp(
        home: Scaffold(
      drawer: Drawer(
          child: ListView(children: [
        UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: dataController.model.projectTheme.value),
            accountName: const Text("PUC-MG"),
            accountEmail: const Text("Lucas Jose da Cunha"),
            currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.cookielaw.org/logos/2182e5b0-78dc-4d97-a438-fb223b451736/842ea97a-a8f2-46e9-982c-eba6d612165c/677304d5-c81f-4506-976e-ab32a31ec753/logoPucMinas.png'))),
        ListTile(
            onTap: () {
              Get.toNamed('/tela1');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [
                Icon(Icons.light),
                Text("  Iluminação"),
              ],
            )),
        ListTile(
            onTap: () {
              Get.toNamed('/tela2');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [Icon(Icons.thermostat), Text("  Temperatura")],
            )),
        ListTile(
            onTap: () {
              Get.toNamed('/tela3');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [Icon(Icons.settings), Text("  Configurações")],
            ))
      ])),
      appBar: AppBar(
          title: const Text("Dispositivos IOT",
              style: TextStyle(color: Colors.white)),
          backgroundColor: dataController.model.projectTheme.value),
      body: Center(
        child: Column(children: [
          Text(
            'Iluminação',
            style: TextStyle(
                color: dataController.model.projectTheme.value, fontSize: 20),
          ),
          Obx(() => SwitchLight(
              icon: Icons.pentagon,
              label: "Laboratório",
              state: dataController.model.ilumH1.value,
              h: "h1")),
          Obx(() => SwitchLight(
              icon: Icons.chair_outlined,
              label: "Escritório",
              state: dataController.model.ilumH2.value,
              h: "h2")),
          Obx(() => SwitchLight(
              icon: Icons.house,
              label: "Recepção",
              state: dataController.model.ilumH3.value,
              h: "h3")),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                logout();
              },
              child: const Text("Sair"))
        ]),
      ),
    ));
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ModelData());
    Get.put(ControllerData());
    var dataController = Get.find<ControllerData>();
    return MaterialApp(
        home: Scaffold(
      drawer: Drawer(
          child: ListView(children: [
        UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: dataController.model.projectTheme.value),
            accountName: const Text("PUC-MG"),
            accountEmail: const Text("Lucas Jose da Cunha"),
            currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.cookielaw.org/logos/2182e5b0-78dc-4d97-a438-fb223b451736/842ea97a-a8f2-46e9-982c-eba6d612165c/677304d5-c81f-4506-976e-ab32a31ec753/logoPucMinas.png'))),
        ListTile(
            onTap: () {
              Get.toNamed('/tela1');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [
                Icon(Icons.light),
                Text("  Iluminação"),
              ],
            )),
        ListTile(
            onTap: () {
              Get.toNamed('/tela2');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [Icon(Icons.thermostat), Text("  Temperatura")],
            )),
        ListTile(
            onTap: () {
              Get.toNamed('/tela3');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [Icon(Icons.settings), Text("  Configurações")],
            ))
      ])),
      appBar: AppBar(
          title: const Text("Dispositivos IOT",
              style: TextStyle(color: Colors.white)),
          backgroundColor: dataController.model.projectTheme.value),
      body: Center(
        child: Column(children: [
          Text(
            'Temperatura',
            style: TextStyle(
                color: dataController.model.projectTheme.value, fontSize: 20),
          ),
          Obx(() => TextTemp(
              label: "Laboratório:",
              temp: dataController.model.tempT1.value.toString())),
          Obx(() => TextTemp(
              label: "Escritório:",
              temp: dataController.model.tempT2.value.toString())),
          Obx(() => TextTemp(
              label: "Recepção:",
              temp: dataController.model.tempT3.value.toString())),
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

class Tela3 extends StatelessWidget {
  const Tela3({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ModelData());
    Get.put(ControllerData());
    var dataController = Get.find<ControllerData>();
    return MaterialApp(
        home: Scaffold(
      drawer: Drawer(
          child: ListView(children: [
        UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: dataController.model.projectTheme.value),
            accountName: const Text("PUC-MG"),
            accountEmail: const Text("Lucas Jose da Cunha"),
            currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.cookielaw.org/logos/2182e5b0-78dc-4d97-a438-fb223b451736/842ea97a-a8f2-46e9-982c-eba6d612165c/677304d5-c81f-4506-976e-ab32a31ec753/logoPucMinas.png'))),
        ListTile(
            onTap: () {
              Get.toNamed('/tela1');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [
                Icon(Icons.light),
                Text("  Iluminação"),
              ],
            )),
        ListTile(
            onTap: () {
              Get.toNamed('/tela2');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [Icon(Icons.thermostat), Text("  Temperatura")],
            )),
        ListTile(
            onTap: () {
              Get.toNamed('/tela3');
            }, // Use o Get.toNamed para ir para alguma página
            title: const Row(
              children: [Icon(Icons.settings), Text("  Configurações")],
            ))
      ])),
      appBar: AppBar(
          title: const Text("Dispositivos IOT",
              style: TextStyle(color: Colors.white)),
          backgroundColor: dataController.model.projectTheme.value),
      body: Center(
        child: Column(children: [
          Text(
            'Iluminação',
            style: TextStyle(
                color: dataController.model.projectTheme.value, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Unidade: "),
              DropdownButton(
                  value: dataController.model.tempUnit.value,
                  items: const [
                    DropdownMenuItem(value: 1, child: Text("ºC")),
                    DropdownMenuItem(value: 2, child: Text("K"))
                  ],
                  onChanged: (value) => dataController.convertTemp(value!))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Cor da barra: "),
              DropdownButton(
                  value: dataController.model.projectTheme.value,
                  items: const [
                    DropdownMenuItem(value: Colors.blue, child: Text("Azul")),
                    DropdownMenuItem(value: Colors.green, child: Text("Verde")),
                    DropdownMenuItem(value: Colors.red, child: Text("Vermelho"))
                  ],
                  onChanged: (value) =>
                      dataController.model.projectTheme.value = value!)
            ],
          ),
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

class SwitchLight extends StatelessWidget {
  SwitchLight(
      {super.key,
      required this.icon,
      required this.label,
      required this.state,
      required this.h});

  final IconData icon;
  final String label;
  final bool state;
  final String h;

  var dataController = Get.find<ControllerData>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Text(label),
        Switch(
            value: state,
            onChanged: (_) => dataController.toggleIlum(h),
            activeColor: dataController.model.projectTheme.value)
      ],
    );
  }
}

class TextTemp extends StatelessWidget {
  TextTemp({super.key, required this.label, required this.temp});

  final String label;
  final String temp;
  var dataController = Get.find<ControllerData>();

  @override
  Widget build(BuildContext context) {
    var tempUnit = dataController.model.tempUnit.value == 1 ? "ºC" : "K";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.thermostat),
        Text(label),
        Text(" $temp $tempUnit")
      ],
    );
  }
}

class Login extends StatelessWidget {
  Login({super.key});

  var estilo = const TextStyle(fontSize: 24);
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    logout();
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('PUC-MG - Login'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20),
          const Image(
              alignment: Alignment.center,
              image: NetworkImage(
                  "https://cdn-icons-png.freepik.com/256/1077/1077114.png")),
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
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      login(email.text, senha.text);
                    },
                    child: const Text("Entrar"))),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
                onPressed: () {
                  Get.toNamed('/cadastro');
                },
                child: const Text("Criar conta",
                    style: TextStyle(
                        color: Colors.blue, backgroundColor: Colors.white))),
            OutlinedButton(
                onPressed: () {
                  Get.toNamed("/recuperarSenha");
                },
                child: const Text("Esqueci a senha",
                    style: TextStyle(
                        color: Colors.blue, backgroundColor: Colors.white)))
          ])
        ]),
      ),
    ));
  }
}

class Cadastro extends StatelessWidget {
  Cadastro({super.key});

  var estilo = const TextStyle(fontSize: 20);
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      criarConta(email.text, senha.text);
                      Get.toNamed('/');
                    },
                    child: Text(
                      "Criar conta",
                      style: estilo,
                    ))),
          ),
        ]),
      ),
    ));
  }
}

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  var estilo = const TextStyle(fontSize: 20);
  var email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.back_hand)),
            const Text('Recuperar senha'),
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
            child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      resetPassword(email: email.text);
                      Get.snackbar("Aviso", "E-mail de recuperação enviado!");
                      Get.toNamed('/');
                    },
                    child: Text(
                      "Enviar e-mail",
                      style: estilo,
                    ))),
          ),
        ]),
      ),
    ));
  }
}