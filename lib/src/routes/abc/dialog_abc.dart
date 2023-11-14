part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/14
///

/// https://api.flutter.dev/flutter/material/BottomSheet-class.html
class DialogAbc extends StatefulWidget {
  const DialogAbc({super.key});

  @override
  State<DialogAbc> createState() => _DialogAbcState();
}

class _DialogAbcState extends State<DialogAbc> with BaseAbcStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ThemeData newThemeData = themeData.copyWith(
      bottomSheetTheme: themeData.bottomSheetTheme.copyWith(
        showDragHandle: true,
      ),
    );
    return Theme(
      data: newThemeData,
      child: super.build(context),
    );
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      const Text(
        "Sheet↓",
        textAlign: TextAlign.center,
      ),
      <Widget>[
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return randomWidget(randomText());
              },
            );
          },
          child: const Text("Sheet1"),
        ),
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 12,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("Sheet2"),
        ),
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 12,
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("Sheet3"),
        ),
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 12,
              constraints: const BoxConstraints.expand(),
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("Sheet4"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return randomWidget(randomText());
              },
            );
          },
          child: const Text("SheetModal1"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              elevation: 12,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("SheetModal2"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              elevation: 12,
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("SheetModal3"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              anchorPoint: Offset.zero,
              constraints: const BoxConstraints.expand(),
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("SheetModal4"),
        ),
      ].wrap(),
    ];
  }
}
