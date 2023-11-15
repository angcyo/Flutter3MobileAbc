part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/15
///
class TextFieldAbc extends StatefulWidget {
  const TextFieldAbc({super.key});

  @override
  State<TextFieldAbc> createState() => _TextFieldAbcState();
}

class _TextFieldAbcState extends State<TextFieldAbc> with BaseAbcStateMixin {
  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      const Text(
        'TextField↓',
        textAlign: TextAlign.center,
      ),
      const TextField(
        decoration: InputDecoration(
          labelText: "default",
        ),
      ),
      const TextField(
        obscureText: true,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          labelText: "default-obscure",
        ),
      ),
      const TextField(
        decoration: InputDecoration(
          labelText: "default-border",
          border: OutlineInputBorder(),
        ),
      ),
    ];
  }
}
