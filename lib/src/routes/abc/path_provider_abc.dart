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
  Text? files;

  @override
  void initState() {
    super.initState();
    //pathViewModel.loadPath().whenComplete(() => updateState());
  }

  void setFiles(List<PlatformFile>? list) {
    if (list == null || list.isEmpty) {
      files = const Text('取消选择');
    } else {
      files = textSpanBuilder((builder) {
        builder.addText('选择了${list.length}个文件:\n');
        list.forEachIndexed((index, element) {
          builder.addText('$index:${element.name}',
              style: const TextStyle(color: Colors.red));
          builder.addText('->${element.path}\n');
        });
      });
    }
    updateState();
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

      //test

      list.add([
        GradientButton(
          onPressed: () async {
            setFiles((await pickFiles(allowMultiple: false))?.files);
          },
          child: const Text("选择文件(单选)"),
        ),
        GradientButton(
          onPressed: () async {
            setFiles((await pickFiles(
              dialogTitle: "选择文件(多选)",
              allowMultiple: true,
            ))
                ?.files);
          },
          child: const Text("选择文件(多选)"),
        ),
        GradientButton(
          onPressed: () async {
            var path = await pickDirectoryPath();
            if (path != null) {
              files = Text('选择了文件夹:$path');
            } else {
              files = const Text('取消选择');
            }
            updateState();
          },
          child: const Text("选择文件夹"),
        ),
      ].wrap());

      if (files != null) {
        list.add(files!);
      }

      return list;
    }
  }
}
