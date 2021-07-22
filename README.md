# notificacion_push

Proyecto develeopeado con flutter

## Objetivos.

1. Generar una notificacion push y enviarle su resp correspondiente.
2. Generar una actualización tal vez cuando el telefono no tenga la conectividad, intento generar persistencia
de data


## Estructura proyecto segun integrador de notificacion y sincronización

1. Para utilizar firebase: 
Nota: puedes solamente utilizar la rama main del proyecto
1.1. Renombrar el file main.dart a main_amplify.dart
1.2. Renombrar el file main_firebase.dart a main.dart

2. Para utilizar sincronización de datos con aws amplify:
2.1. utilizar la rama flutter_awsamplify
2.2. instalar amplify mediante curl -sL https://aws-amplify.github.io/amplify-cli/install | bash && $SHELL
2.3. realizar el pull del modelo inicial de amplify mediante amplify pull --appId d3pdvv6wg6sklm --envName staging


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
