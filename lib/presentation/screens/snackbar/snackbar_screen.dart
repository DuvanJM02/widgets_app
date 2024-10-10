import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('Estás seguro?'),
              content: const Text(
                  'Fugiat elit commodo sint qui tempor irure duis commodo quis reprehenderit exercitation exercitation qui. Adipisicing est reprehenderit in fugiat nisi consequat labore reprehenderit Lorem adipisicing eiusmod non laborum. Dolor laboris incididunt et sunt cillum eiusmod occaecat Lorem. Anim ut anim cupidatat laborum nostrud sit proident occaecat dolore est. Quis enim dolore labore consectetur ut fugiat voluptate eiusmod. Reprehenderit id ullamco fugiat adipisicing voluptate.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Commodo proident dolor ex eu deserunt laborum ad elit qui et fugiat laboris. Ex dolor aliqua voluptate velit adipisicing deserunt nisi fugiat veniam ipsum fugiat deserunt anim excepteur. Aliquip tempor adipisicing Lorem aliquip commodo nostrud aute. Sit id occaecat eiusmod proident consequat voluptate elit consectetur et ut. Eu incididunt excepteur eiusmod nisi sunt est fugiat deserunt reprehenderit ad.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
