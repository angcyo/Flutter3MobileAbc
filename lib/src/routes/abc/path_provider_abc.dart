part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/17
///

class PathProviderAbc extends StatefulWidget {
  const PathProviderAbc({super.key});

  @override
  State<PathProviderAbc> createState() => _PathProviderAbcState();
}

class _PathProviderAbcState extends State<PathProviderAbc>
    with BaseAbcStateMixin {
  final PathViewModel pathViewModel = PathViewModel();

  @override
  void initState() {
    super.initState();
    //pathViewModel.loadPath().whenComplete(() => updateState());
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    var map = pathViewModel.pathMap.value;
    if (pathViewModel.pathMap.value == null) {
      pathViewModel.loadPath().whenComplete(() => context.tryUpdateState());
      return [
        const Text(
          'loading...',
          textAlign: TextAlign.center,
        )
      ];
    } else {
      //遍历map
      WidgetList list = [];
      l.i(defaultTargetPlatform);
      map!.forEach((key, value) {
        l.i('$key->${value?.path}');
        list.add(ListTile(
          title: Text(key),
          subtitle: Text("$value"),
        ));
      });

      //hive abc
      hiveAll().forEach((key, value) {
        list.add(ListTile(
          title: Text(key),
          subtitle: Text("${value.runtimeType}:$value"),
        ));
      });

      return list;
    }
  }
}
