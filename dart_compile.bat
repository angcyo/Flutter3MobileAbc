@REM https://dart.dev/tools/dart-compile
@REM https://dart.dev/tools/dart-tool
@REM
@REM -> dart compile -h
@REM Compile Dart to various formats.
@REM
@REM Usage: dart compile <subcommand> [arguments]
@REM -h, --help    Print this usage information.
@REM
@REM Available subcommands:
@REM   aot-snapshot   Compile Dart to an AOT snapshot.
@REM   exe            Compile Dart to a self-contained executable.
@REM   jit-snapshot   Compile Dart to a JIT snapshot.
@REM   js             Compile Dart to JavaScript.
@REM   kernel         Compile Dart to a kernel snapshot.
@REM   wasm           Compile Dart to a WebAssembly/WasmGC module.
@REM
@REM Run "dart help" to see global options.
@REM
@REM -----------------------------------------------------------------------------------------------
@REM
@REM -> dart compile exe -h
@REM Compile Dart to a self-contained executable.
@REM
@REM Usage: dart compile exe [arguments] <dart entry point>
@REM -h, --help                          Print this usage information.
@REM -o, --output                        Write the output to <file name>.
@REM                                     This can be an absolute or relative path.
@REM     --verbosity                     Sets the verbosity level of the compilation.
@REM
@REM           [all] (default)           Show all messages
@REM           [error]                   Show only error messages
@REM           [info]                    Show error, warning, and info messages
@REM           [warning]                 Show only error and warning messages
@REM
@REM -D, --define=<key=value>            Define an environment declaration. To specify multiple declarations, use multiple options or use commas to separate key-value pairs.
@REM                                     For example: dart compile exe -Da=1,b=2 main.dart
@REM     --enable-asserts                Enable assert statements.
@REM -p, --packages=<path>               Get package locations from the specified file instead of .dart_tool/package_config.json.
@REM                                     <path> can be relative or absolute.
@REM                                     For example: dart compile exe --packages=/tmp/pkgs.json main.dart
@REM -S, --save-debugging-info=<path>    Remove debugging information from the output and save it separately to the specified file.
@REM                                     <path> can be relative or absolute.
@REM     --depfile=<path>                Path to output Ninja depfile
@REM     --target-os                     Compile to a specific target operating system.
@REM                                     [android, fuchsia, ios, linux, macos, windows]
@REM
@REM Run "dart help" to see global options.
:: ## Linux and macOS
:: https://github.com/dart-lang/samples/tree/main/native_app#linux-and-macos
:: dart compile exe bin/main.dart -o main
::
:: ## Windows
:: https://github.com/dart-lang/samples/tree/main/native_app#windows
:: dart compile exe bin/main.dart -o main.exe