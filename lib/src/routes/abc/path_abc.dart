import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/12/10
///
class PathAbc extends StatefulWidget {
  const PathAbc({super.key});

  @override
  State<PathAbc> createState() => _PathAbcState();
}

class _PathAbcState extends State<PathAbc> with AbsScrollPage {
  final colors = [
    const Color(0xff6aaef9),
    const Color(0xff4994ec),
    const Color(0xff357acf),
    const Color(0xff2962b4),
  ];

  final homeBgColor = const Color(0xff4a4a4f);
  final homeColor = const Color(0xffdbdbdb);

  @override
  WidgetList? buildScrollBody(BuildContext context) {
    return [
      PathWidget(
        path:
            "m23.167,330.833v-7h4.667v7h5.833v-9.333h3.5l-11.667-10.5-11.667,10.5h3.5v9.333h5.833Z"
                .toUiPath(),
      ).bounds(),
      PathRegionWidget(
        reverseHitTest: true,
        regionInfoList: [
          //left
          ...[
            PathRegionInfo(
              path:
                  "m144.743,155.35l-23.97-23.97c-9.237,11.547-14.773,26.184-14.773,42.121s5.536,30.573,14.773,42.121l23.97-23.97c.621-.621.782-1.584.354-2.351-2.608-4.677-4.097-10.064-4.097-15.799s1.489-11.122,4.098-15.799c.428-.767.267-1.73-.354-2.351Z"
                      .toUiPath(),
              fillColor: colors[0],
            ),
            PathRegionInfo(
              path:
                  "m132.727,143.333l-36.814-36.814c-15.523,17.965-24.912,41.376-24.912,66.981s9.39,49.016,24.912,66.981l37.258-37.258c-6.389-8.398-10.188-18.874-10.188-30.24,0-11.101,3.623-21.353,9.744-29.649Z"
                      .toUiPath(),
              fillColor: colors[1],
            ),
            PathRegionInfo(
              path:
                  "m132.727,143.333l-61.608-61.608c-21.833,24.34-35.119,56.504-35.119,91.774s13.286,67.435,35.119,91.774l62.052-62.052c-6.389-8.398-10.188-18.874-10.188-30.24,0-11.101,3.623-21.353,9.744-29.649Z"
                      .toUiPath(),
              fillColor: colors[2],
            ),
            PathRegionInfo(
              path:
                  "m132.727,143.333L49.329,59.936c-1.641-1.641-4.325-1.538-5.85.21C17.028,90.461,1,130.107,1,173.5s16.028,83.039,42.479,113.354c1.525,1.748,4.209,1.85,5.85.21l83.841-83.841c-6.389-8.398-10.188-18.874-10.188-30.24,0-11.101,3.623-21.353,9.744-29.649Z"
                      .toUiPath(),
              fillColor: colors[3],
            )
          ].reversed,
          //right
          ...[
            PathRegionInfo(
              path:
                  "m202.257,191.65l23.97,23.97c9.237-11.547,14.773-26.184,14.773-42.121s-5.536-30.573-14.773-42.121l-23.97,23.97c-.621.621-.782,1.584-.354,2.351,2.608,4.677,4.097,10.064,4.097,15.799s-1.489,11.122-4.097,15.799c-.428.767-.267,1.73.354,2.351Z"
                      .toUiPath(),
              fillColor: colors[0],
            ),
            PathRegionInfo(
              path:
                  "m213.239,202.632l37.849,37.849c15.523-17.965,24.912-41.376,24.912-66.981s-9.39-49.016-24.912-66.981l-37.419,37.419c5.856,8.189,9.314,18.21,9.314,29.045,0,11.101-3.623,21.353-9.744,29.65Z"
                      .toUiPath(),
              fillColor: colors[1],
            ),
            PathRegionInfo(
              path:
                  "m213.239,202.632l62.642,62.642c21.833-24.34,35.119-56.504,35.119-91.774s-13.286-67.435-35.119-91.774l-62.212,62.212c5.856,8.189,9.314,18.21,9.314,29.045,0,11.101-3.623,21.353-9.744,29.65Z"
                      .toUiPath(),
              fillColor: colors[2],
            ),
            PathRegionInfo(
              path:
                  "m213.239,202.632l84.427,84.427c1.643,1.643,4.332,1.541,5.859-.21,26.449-30.314,42.475-69.958,42.475-113.349s-16.026-83.035-42.475-113.349c-1.528-1.751-4.216-1.853-5.859-.21l-83.997,83.997c5.856,8.189,9.314,18.21,9.314,29.045,0,11.101-3.623,21.353-9.744,29.65Z"
                      .toUiPath(),
              fillColor: colors[3],
            )
          ].reversed,
          //top
          ...[
            PathRegionInfo(
              path:
                  "m155.35,144.743c.621.621,1.584.782,2.351.354,4.677-2.608,10.064-4.097,15.799-4.097s11.122,1.489,15.799,4.097c.767.428,1.73.267,2.351-.354l23.97-23.97c-11.547-9.237-26.184-14.773-42.121-14.773s-30.573,5.536-42.121,14.773l23.97,23.97Z"
                      .toUiPath(),
              fillColor: colors[0],
            ),
            PathRegionInfo(
              path:
                  "m143.333,132.727c8.297-6.121,18.548-9.744,29.65-9.744,11.366,0,21.842,3.799,30.24,10.188l37.258-37.258c-17.965-15.523-41.376-24.912-66.981-24.912s-49.016,9.39-66.981,24.912l36.814,36.814Z"
                      .toUiPath(),
              fillColor: colors[1],
            ),
            PathRegionInfo(
              path:
                  "m143.333,132.727c8.297-6.121,18.548-9.744,29.65-9.744,11.366,0,21.842,3.799,30.24,10.188l62.052-62.052c-24.34-21.833-56.504-35.119-91.774-35.119s-67.435,13.286-91.774,35.119l61.608,61.608Z"
                      .toUiPath(),
              fillColor: colors[2],
            ),
            PathRegionInfo(
              path:
                  "m143.333,132.727c8.297-6.121,18.548-9.744,29.65-9.744,11.366,0,21.842,3.799,30.24,10.188l83.834-83.834c1.644-1.644,1.542-4.335-.21-5.863C256.533,17.025,216.89,1,173.5,1S90.467,17.025,60.153,43.473c-1.752,1.529-1.855,4.219-.21,5.863l83.39,83.39Z"
                      .toUiPath(),
              fillColor: colors[3],
            )
          ].reversed,
          //bottom
          ...[
            PathRegionInfo(
              path:
                  "m191.65,202.257c-.621-.621-1.584-.782-2.351-.354-4.677,2.608-10.064,4.098-15.799,4.098s-11.122-1.489-15.799-4.098c-.767-.428-1.73-.267-2.351.354l-23.97,23.97c11.547,9.237,26.184,14.773,42.121,14.773s30.573-5.536,42.121-14.773l-23.97-23.97Z"
                      .toUiPath(),
              fillColor: colors[0],
            ),
            PathRegionInfo(
              path:
                  "m202.632,213.239c-8.296,6.121-18.548,9.744-29.65,9.744-10.835,0-20.856-3.458-29.045-9.314l-37.419,37.419c17.965,15.523,41.376,24.912,66.981,24.912s49.016-9.39,66.981-24.912l-37.849-37.849Z"
                      .toUiPath(),
              fillColor: colors[1],
            ),
            PathRegionInfo(
              path:
                  "m202.632,213.239c-8.296,6.121-18.548,9.744-29.65,9.744-10.835,0-20.856-3.458-29.045-9.314l-62.212,62.212c24.34,21.833,56.504,35.119,91.774,35.119s67.435-13.286,91.775-35.119l-62.642-62.642Z"
                      .toUiPath(),
              fillColor: colors[2],
            ),
            PathRegionInfo(
              path:
                  "m204.986,215.593c-1.345-1.345-3.435-1.534-5.036-.506-7.781,4.995-17.034,7.896-26.967,7.896-9.684,0-18.718-2.762-26.374-7.53-1.597-.995-3.66-.795-4.991.536l-81.674,81.674c-1.644,1.644-1.542,4.335.21,5.864,30.314,26.448,69.957,42.473,113.346,42.473s83.032-16.025,113.346-42.473c1.752-1.529,1.855-4.22.21-5.864l-82.071-82.071Z"
                      .toUiPath(),
              fillColor: colors[3],
            )
          ].reversed,
          //--other
          PathRegionInfo(
            path:
                "m63.219,8.5H14.495c-3.311,0-5.995,2.684-5.995,5.995v48.724c0,5.851,7.555,8.259,10.892,3.454,12.807-18.441,28.839-34.473,47.28-47.28,4.805-3.337,2.397-10.892-3.454-10.892Z"
                    .toUiPath(),
            fillColor: homeBgColor,
          ),
          PathRegionInfo(
            path:
                "m338.5,63.219V14.495c0-3.311-2.684-5.995-5.995-5.995h-48.724c-5.851,0-8.259,7.555-3.454,10.892,18.441,12.807,34.473,28.839,47.28,47.28,3.337,4.805,10.892,2.397,10.892-3.454Z"
                    .toUiPath(),
            fillColor: homeBgColor,
          ),
          PathRegionInfo(
            path:
                "m283.781,338.5h48.724c3.311,0,5.995-2.684,5.995-5.995v-48.724c0-5.851-7.555-8.259-10.892-3.454-12.807,18.441-28.839,34.473-47.28,47.28-4.805,3.337-2.397,10.892,3.454,10.892Z"
                    .toUiPath(),
            fillColor: homeBgColor,
          ),
          PathRegionInfo(
            path:
                "m8.5,283.781v48.724c0,3.311,2.684,5.995,5.995,5.995h48.724c5.851,0,8.259-7.555,3.454-10.892-18.441-12.807-34.473-28.839-47.28-47.28-3.337-4.805-10.892-2.397-10.892,3.454Z"
                    .toUiPath(),
            fillColor: homeBgColor,
          ),
          //--home
          PathRegionInfo(
            path:
                "m323.833,28.167v-5h3.333v5h4.167v-6.667h2.5l-8.333-7.5-8.333,7.5h2.5v6.667h4.167Z"
                    .toUiPath(),
            fillColor: homeColor,
          ),
          PathRegionInfo(
            path:
                "m19.833,28.167v-5h3.333v5h4.167v-6.667h2.5l-8.333-7.5-8.333,7.5h2.5v6.667h4.167Z"
                    .toUiPath(),
            fillColor: homeColor,
          ),
          PathRegionInfo(
            path:
                "m323.833,332.167v-5h3.333v5h4.167v-6.667h2.5l-8.333-7.5-8.333,7.5h2.5v6.667h4.167Z"
                    .toUiPath(),
            fillColor: homeColor,
          ),
          PathRegionInfo(
            path:
                "m23.167,330.833v-7h4.667v7h5.833v-9.333h3.5l-11.667-10.5-11.667,10.5h3.5v9.333h5.833Z"
                    .toUiPath(),
            fillColor: homeColor,
          ),
          //center
          PathRegionInfo(
            path:
                "m174.917,174.917v4.25h-2.833v-4.25h-4.25v-2.833h4.25v-4.25h2.833v4.25h4.25v2.833h-4.25Zm-11.333-11.333h5.667v-2.833h-5.664c-1.566,0-2.836,1.27-2.836,2.836v5.664h2.833v-5.667Zm19.831-2.833h-5.664v2.833h5.667v5.667h2.833v-5.664c0-1.566-1.27-2.836-2.836-2.836Zm.002,22.667h-5.667v2.833h5.664c1.566,0,2.836-1.27,2.836-2.836v-5.664h-2.833v5.667Zm-19.833-5.667h-2.833v5.664c0,1.566,1.27,2.836,2.836,2.836h5.664v-2.833h-5.667v-5.667Z"
                    .toUiPath(),
          ),
          //z
          PathRegionInfo(
            path:
                "m374.356,160.75h19.771c.829.829,1.294,1.294,2.123,2.123v19.771l-2.833-2.833v-15.764l-.463-.463h-15.764l-2.833-2.833Zm15.613,15.613c.389-.877.614-1.842.614-2.863,0-3.912-3.171-7.083-7.083-7.083-1.021,0-1.986.225-2.863.614l2.278,2.278c.193-.027.384-.059.585-.059,2.344,0,4.25,1.906,4.25,4.25,0,.2-.032.392-.059.585l2.278,2.278Zm-3.81-3.81c-.285-.799-.913-1.427-1.712-1.712l1.712,1.712Zm9.03,12.636l1.334,1.334-1.803,1.803-2.076-2.076h-19.771c-.829-.829-1.294-1.294-2.123-2.123v-19.771l-2.076-2.076,1.803-1.803,1.334,1.334,5.607,5.607,1.073,1.073,2.005,2.005,1,1,3.42,3.42,1.587,1.587,2.005,2.005,1.073,1.073,5.607,5.607Zm-15.939-11.689c0,2.343,1.906,4.25,4.25,4.25.2,0,.392-.032.585-.059l-1.532-1.532c-.799-.285-1.427-.913-1.712-1.712l-1.532-1.532c-.027.193-.059.385-.059.585Zm10.56,9.917l-3.448-3.447c-.877.389-1.842.614-2.863.614-3.912,0-7.083-3.171-7.083-7.083,0-1.021.225-1.986.614-2.863l-3.447-3.447v15.764l.463.463h15.764Zm-13.394-4.25c-.782,0-1.417.634-1.417,1.417s.634,1.417,1.417,1.417,1.417-.634,1.417-1.417-.634-1.417-1.417-1.417Zm15.583-12.75c0-.782-.634-1.417-1.417-1.417s-1.417.634-1.417,1.417.634,1.417,1.417,1.417,1.417-.634,1.417-1.417Z"
                    .toUiPath(),
          ),
          //--top
          ...[
            PathRegionInfo(
              path:
                  "m383.5,106c-8.836,0-17.266,1.715-25,4.802v26.262c0,.531.211,1.04.586,1.416l6.262,6.262c.621.621,1.584.782,2.351.354,4.677-2.609,10.064-4.096,15.8-4.096s11.123,1.488,15.8,4.096c.767.428,1.73.267,2.351-.354l6.262-6.262c.375-.375.586-.885.586-1.416v-26.262c-7.734-3.087-16.164-4.802-25-4.802Z"
                      .toUiPath(),
              fillColor: colors[0],
            ),
            PathRegionInfo(
              path:
                  "m408.5,74.077c-8.002-2.006-16.376-3.077-25-3.077s-16.998,1.071-25,3.077v47.255h50v-47.255Z"
                      .toUiPath(),
              fillColor: colors[1],
            ),
            PathRegionInfo(
              path:
                  "m408.5,38.274c-8.108-1.489-16.462-2.274-25-2.274s-16.892.785-25,2.274v83.057h50V38.274Z"
                      .toUiPath(),
              fillColor: colors[2],
            ),
            PathRegionInfo(
              path:
                  "m408.5,121.331V6.998c0-3.313-2.686-5.998-5.998-5.998h-38.003c-3.313,0-5.998,2.686-5.998,5.998v114.333h50Z"
                      .toUiPath(),
              fillColor: colors[3],
            )
          ].reversed,
          //--bottom
          ...[
            PathRegionInfo(
              path:
                  "m383.5,206c-5.736,0-11.123-1.488-15.8-4.096-.767-.428-1.73-.267-2.351.354l-6.262,6.262c-.375.375-.586.885-.586,1.415v24.87c0,.838.513,1.6,1.298,1.895,7.376,2.77,15.358,4.3,23.702,4.3s16.326-1.53,23.702-4.3c.785-.295,1.298-1.057,1.298-1.895v-24.87c0-.531-.211-1.04-.586-1.415l-6.262-6.262c-.621-.621-1.584-.782-2.351-.354-4.677,2.609-10.064,4.096-15.8,4.096Z"
                      .toUiPath(),
              fillColor: colors[0],
            ),
            PathRegionInfo(
              path:
                  "m358.5,272.923c8.002,2.006,16.376,3.077,25,3.077s16.998-1.071,25-3.077v-51.592h-50v51.592Z"
                      .toUiPath(),
              fillColor: colors[1],
            ),
            PathRegionInfo(
              path:
                  "m358.5,308.726c8.108,1.489,16.462,2.274,25,2.274s16.892-.785,25-2.274v-87.395h-50v87.395Z"
                      .toUiPath(),
              fillColor: colors[2],
            ),
            PathRegionInfo(
              path:
                  "m358.5,221.331v118.664c0,3.316,2.688,6.005,6.005,6.005h37.991c3.316,0,6.005-2.688,6.005-6.005v-118.664h-50Z"
                      .toUiPath(),
              fillColor: colors[3],
            )
          ].reversed,
        ],
      ).size(height: 200).bounds(),
    ];
  }
}
