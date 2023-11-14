part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/09
///

/// https://api.flutter.dev/flutter/material/ButtonStyle-class.html#material-3-button-types
class ButtonAbc extends StatefulWidget {
  const ButtonAbc({super.key});

  @override
  State<ButtonAbc> createState() => _ButtonAbcState();
}

class _ButtonAbcState extends State<ButtonAbc> with BaseAbcStateMixin {
  @override
  bool get enableFrameLoad => true;

  onPressed() {}

  @override
  List<Widget> buildBodyList(BuildContext context) {
    List<Widget> list1 = [
      ElevatedButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: randomTextWidget(),
      ),
      ElevatedButton(
        onPressed: null,
        child: randomTextWidget(),
      ),
    ];
    List<Widget> list2 = [
      FilledButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.access_alarm),
        label: randomTextWidget(),
      ),
      FilledButton(
        onPressed: null,
        child: randomTextWidget(),
      ),
      FilledButton.tonal(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      FilledButton.tonalIcon(
        onPressed: null,
        icon: const Icon(Icons.account_tree),
        label: randomTextWidget(),
      ),
    ];
    List<Widget> list3 = [
      OutlinedButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      OutlinedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.account_circle_rounded),
        label: randomTextWidget(),
      ),
      OutlinedButton(
        onPressed: null,
        child: randomTextWidget(),
      ),
    ];

    List<Widget> list4 = [
      TextButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add_circle),
        label: randomTextWidget(),
      ),
      TextButton(
        onPressed: null,
        child: randomTextWidget(),
      ),
    ];

    List<Widget> list5 = [
      FloatingActionButton.small(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      FloatingActionButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      FloatingActionButton.large(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      FloatingActionButton.extended(
        onPressed: onPressed,
        icon: const Icon(Icons.accessible),
        label: randomTextWidget(),
      ),
      FloatingActionButton(
        onPressed: null,
        child: randomTextWidget(),
      ),
    ];

    List<Widget> list6 = [
      IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.ad_units),
      ),
      IconButton.filled(onPressed: onPressed, icon: const Icon(Icons.ad_units)),
      IconButton.filledTonal(
          onPressed: onPressed, icon: const Icon(Icons.ad_units)),
      IconButton.outlined(
          onPressed: onPressed, icon: const Icon(Icons.ad_units)),
      const IconButton(
        onPressed: null,
        icon: Icon(Icons.add_alarm),
      ),
    ];

    List<Widget> list7 = [
      GradientButton(
        onPressed: onPressed,
        child: const Icon(Icons.ad_units),
      ),
      GradientButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      GradientButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(45),
        child: randomTextWidget(),
      ),
      GradientButton(
        onPressed: null,
        borderRadius: BorderRadius.circular(45),
        child: randomTextWidget(),
      ),
      ElevatedGradientButton(
        onPressed: onPressed,
        child: const Icon(Icons.ad_units),
      ),
      ElevatedGradientButton(
        onPressed: onPressed,
        child: randomTextWidget(),
      ),
      ElevatedGradientButton(
        onPressed: onPressed,
        borderRadius: BorderRadius.circular(45),
        child: randomTextWidget(),
      ),
      ElevatedGradientButton(
        onPressed: null,
        borderRadius: BorderRadius.circular(45),
        child: randomTextWidget(),
      ),
    ];

    return [
      const Text(
        "ElevatedButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        children: [
          ...list1,
        ],
      ),
      const Text(
        "FilledButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        children: [
          ...list2,
        ],
      ),
      const Text(
        "OutlinedButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        children: [
          ...list3,
        ],
      ),
      const Text(
        "TextButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        children: [
          ...list4,
        ],
      ),
      const Text(
        "FloatingActionButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        children: [
          ...list5,
        ],
      ),
      const Text(
        "IconButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        children: [
          ...list6,
        ],
      ),
      const Text(
        "GradientButton↓",
        textAlign: TextAlign.center,
      ),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...list7,
        ],
      ),
    ];
  }
}
