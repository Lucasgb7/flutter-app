import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/model_data.dart';
import '../controller/controller_data.dart';

resetPassword({required String email}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } catch (e) {
    print(e); // showError(title: '...', error: e);
  }
}

listenFirebase(String caminho) {
  Get.put(ControllerData());
  var dataController = Get.find<ControllerData>();

  final ref = FirebaseDatabase.instance.ref(caminho);
  ref.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value as Map;
    // Get values for ilum
    data['ilum'].forEach((key, value) {
      dataController.updateIlum(key.toString(), value);
    });
    // Get values for temperatura
    data['temperatura'].forEach((key, value) {
      dataController.changeTemp(key.toString(), value);
    });
  });

  //print(d.nivel1!);
}

statusLogin() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      Get.toNamed('/');
    } else {
      Get.toNamed('/tela1');
    }
  });
  await listenFirebase("/");
}

logout() async {
  await FirebaseAuth.instance.signOut();
}

login(String email, String senha) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha);
    print("Logado");
    Get.snackbar("Mensagem", "Sucesso");
    //print(credential.user.email.toString());
  } on FirebaseAuthException catch (e) {
    //print(e);

    Get.snackbar("Erro", e.toString());

    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

criarConta(String email, String senha) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
    print("Conta criada com sucesso");
  } on FirebaseAuthException catch (e) {
    print(e.code);

    if (e.code == 'weak-password') {
      print('Senha fraca');
    } else if (e.code == 'email-already-in-use') {
      print('Uma conta já existe para esse email');
    }
  } catch (e) {
    print(e);
  }
}

setFirebase(String caminho, String nome, var valor) async {
  //final database = FirebaseDatabase.instance.ref();
  DatabaseReference ref = FirebaseDatabase.instance.ref(caminho);
  await ref.set({
    nome: valor,
  });
}

updateFirebase(String caminho, String nome, var valor) async {
  //final database = FirebaseDatabase.instance.ref();
  DatabaseReference ref = FirebaseDatabase.instance.ref(caminho);
  await ref.update({
    nome: valor,
  });
}

getFirebase(String caminho) async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child(caminho).get();
  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print('Sem dados.');
  }
}

Future<User> loginWebGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? user;
  GoogleAuthProvider authProvider = GoogleAuthProvider();
  final FirebaseAuth auth = FirebaseAuth.instance;

  try {
    final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

    user = userCredential.user;
  } catch (e) {
    print(e);
  }

  return user!;
}

Future<void> logoutWebGoogle() async {
  await GoogleSignIn().signOut();
}

loginGoogle() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User? user = authResult.user;

    //return user;
  } catch (e) {
    print("Erro na autenticação com o Google: $e");
    // return null;
  }
}

Future<void> logoutGoogle() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    await googleSignIn.signOut();
    await auth.signOut();
    // Logout bem-sucedido
    print("Usuário desconectado com sucesso.");
  } catch (e) {
    print("Erro ao fazer logout: $e");
  }
}