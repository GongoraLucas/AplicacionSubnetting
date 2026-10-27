import '../modelos/usuario_modelo.dart';

class LoginControlador {
  // Credenciales locales utilizadas únicamente para esta práctica.
  final UsuarioModelo _usuarioPrueba = UsuarioModelo(
    usuario: 'admin',
    contrasena: '123456',
  );

  // null indica un acceso válido; de lo contrario devuelve el error.
  String? validar(UsuarioModelo entrada) {
    if (entrada.usuario.trim().isEmpty && entrada.contrasena.trim().isEmpty) {
      return 'Ingresa el usuario y la contraseña.';
    }
    if (entrada.usuario.trim().isEmpty) return 'Ingresa el usuario.';
    if (entrada.contrasena.trim().isEmpty) return 'Ingresa la contraseña.';
    if (entrada.usuario.trim() != _usuarioPrueba.usuario ||
        entrada.contrasena != _usuarioPrueba.contrasena) {
      return 'Usuario o contraseña incorrectos.';
    }
    return null;
  }
}
