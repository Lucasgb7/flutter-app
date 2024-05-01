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
        const UserAccountsDrawerHeader(
            accountName: Text("PUC-MG"),
            accountEmail: Text("Lucas Jose da Cunha"),
            currentAccountPicture: CircleAvatar(
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
          const Text(
            'Iluminação',
            style: TextStyle(color: Colors.blue, fontSize: 20),
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
        const UserAccountsDrawerHeader(
            accountName: Text("PUC-MG"),
            accountEmail: Text("Lucas Jose da Cunha"),
            currentAccountPicture: CircleAvatar(
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
          const Text(
            'Temperatura',
            style: TextStyle(color: Colors.blue, fontSize: 20),
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
        const UserAccountsDrawerHeader(
            accountName: Text("PUC-MG"),
            accountEmail: Text("Lucas Jose da Cunha"),
            currentAccountPicture: CircleAvatar(
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
          const Text(
            'Iluminação',
            style: TextStyle(color: Colors.blue, fontSize: 20),
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
        Switch(value: state, onChanged: (_) => dataController.toggleIlum(h))
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
                      "Entrar",
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
