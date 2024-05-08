import 'package:get/get.dart';

String? emailValidador(String? email) {
  if (email == null || email.isEmpty) {
    return "Digite o seu e-mail.";
  }

  if (!email.isEmail) {
    return "Digite um email válido.";
  }

  return null;
}

String? passwordValidador(String? senha) {
  if (senha == null || senha.isEmpty) {
    return "Digite o sua senha.";
  }

  if (senha.length < 6) {
    return "Digite uma senha com no mínimo seis dígitos.";
  }

  return null;
}

String? nomeValidador(String? nome) {
  if (nome == null || nome.isEmpty) {
    return "Digite o seu nome.";
  }

  if (nome.length < 3) {
    return "Digite o seu nome com no mínimo três dígitos.";
  }

  return null;
}
