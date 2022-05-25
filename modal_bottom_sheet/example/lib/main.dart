import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'examples/cupertino_share/cupertino_share.dart';
import 'examples/modal_fit_will_scope.dart';
import 'examples/modal_with_page_view.dart';
import 'examples/navigator_v2/navigator_v2.dart';

import 'examples/navigator_v2/navigator_v2_cupertino.dart';
import 'modals/avatar_sheet.dart';
import 'modals/bar_sheet.dart';
import 'modals/dialog_sheet.dart';
import 'modals/floating_sheet.dart';
import 'examples/modal_complex_all.dart';
import 'examples/modal_fit.dart';
import 'examples/modal_inside_modal.dart';
import 'examples/modal_will_scope.dart';
import 'examples/modal_with_navigator.dart';
import 'modals/material_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(platform: TargetPlatform.iOS),
      title: 'BottomSheet Modals',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialExtendedPageRoute(
            builder: (context) {
              return MyHomePage(title: 'Flutter Demo Home Page');
            },
          );
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          child: SizedBox.expand(
            child: SingleChildScrollView(
              primary: true,
              child: SafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SectionTitle('SHEET'),
                    ListTile(
                      title: const Text('Simple sheet'),
                      onTap: () => Navigator.of(context).push(
                        MaterialExtendedPageRoute<void>(
                          builder: (context) => CupertinoSharePage(),
                        ),
                      ),
                    ),
                    SectionTitle('COMPLETE EXAMPLES'),
                    ListTile(
                      title: Text('Cupertino Photo Share Example'),
                      onTap: () => Navigator.of(context).push(
                        MaterialExtendedPageRoute<void>(
                          builder: (context) => CupertinoSharePage(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Navigator 2.0 - Sheet'),
                      onTap: () => Navigator.of(context).push(
                        MaterialExtendedPageRoute<void>(
                          builder: (context) => BooksApp(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Navigator 2.0 - CupertinoSheet'),
                      onTap: () => Navigator.of(context).push(
                        MaterialExtendedPageRoute<void>(
                          builder: (context) => CupertinoBooksApp(),
                        ),
                      ),
                    ),
                    SectionTitle('STYLES'),
                    ListTile(
                      title: Text('Material fit'),
                      onTap: () => Navigator.of(context).push(
                        MaterialSheetRoute<void>(
                          fit: SheetFit.loose,
                          builder: (context) => ModalFit(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Bar Modal'),
                      onTap: () => Navigator.of(context).push(
                        BarSheetRoute<void>(
                          fit: SheetFit.loose,
                          builder: (context) => ModalInsideModal(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Avatar Modal'),
                      onTap: () {
                        Navigator.of(context).push(
                          AvatarSheetRoute<void>(
                            builder: (context) => ModalInsideModal(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Float Modal'),
                      onTap: () {
                        Navigator.of(context).push(
                          FloatingSheetRoute<void>(
                            builder: (context) => ModalFit(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Cupertino Modal'),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoSheetRoute<void>(
                            builder: (context) => ModalFit(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Cupertino Sheet with stops'),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoSheetRoute<void>(
                            initialStop: 0.5,
                            stops: [0, 0.5, 1],
                            builder: (context) => ModalFit(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Cupertino Scrollable Sheet with stops'),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoSheetRoute<void>(
                            initialStop: 0.5,
                            stops: [0, 0.5, 1],
                            builder: (context) => ModalInsideModal(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Material Sheet with stops'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialSheetRoute<void>(
                            initialStop: 0.5,
                            stops: [0, 0.5, 1],
                            builder: (context) => ModalFit(),
                          ),
                        );
                      },
                    ),
                    SectionTitle('COMPLEX CASES'),
                    ListTile(
                      title: Text('Cupertino Small Modal forced to expand'),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoSheetRoute<void>(
                            builder: (context) => Scaffold(
                              body: Builder(
                                builder: (context) => SingleChildScrollView(
                                  primary: true,
                                  child: Container(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    // TODO(jaime): It does not work for reverse list yet
                    //  ListTile(
                    //    title: Text('Reverse list'),
                    //    onTap: () => Navigator.of(context).push(
                    //      BarSheetRoute<void>(
                    //        fit: SheetFit.loose,
                    //        builder: (context) => ModalInsideModal(reverse: true),
                    //      ),
                    //    ),
                    //  ),
                    ListTile(
                      title: Text('Cupertino Modal inside modal'),
                      onTap: () => Navigator.of(context).push(
                        CupertinoSheetRoute<void>(
                          builder: (context) => ModalInsideModal(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Cupertino Modal with inside navigation'),
                      onTap: () => Navigator.of(context).push(
                        CupertinoSheetRoute<void>(
                          builder: (context) => ModalWithNavigator(),
                        ),
                      ),
                    ),
                    ListTile(
                      title:
                          Text('Cupertino Navigator + Scroll + WillPopScope'),
                      onTap: () => Navigator.of(context).push(
                        CupertinoSheetRoute<void>(
                          builder: (context) => ComplexModal(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Modal with WillPopScope'),
                      onTap: () => Navigator.of(context).push(
                        CupertinoSheetRoute<void>(
                          builder: (context) => ModalWillScope(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Modal Fit with WillPopScope'),
                      onTap: () => Navigator.of(context).push(
                        CupertinoSheetRoute<void>(
                          builder: (context) => ModalFitWillScope(),
                        ),
                      ),
                    ),

                    // TODO(jaime): It does not work for nested scroll yet
                    // ListTile(
                    //   title: Text('Modal with Nested Scroll'),
                    //   onTap: () => Navigator.of(context).push(
                    //     CupertinoSheetRoute<void>(
                    //       builder: (context) => NestedScrollModal(),
                    //     ),
                    //   ),
                    // ),
                    ListTile(
                      title: Text('Modal with PageView'),
                      onTap: () => Navigator.of(context).push(
                        CupertinoSheetRoute<void>(
                          builder: (BuildContext context) =>
                              ModalWithPageView(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Dialog Modal for tablet - Expanded'),
                      onTap: () => Navigator.of(context).push(
                        DialogSheetRoute<void>(
                          builder: (context) => ModalInsideModal(),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Dialog Modal for tablet - Fit'),
                      onTap: () => Navigator.of(context).push(
                        DialogSheetRoute<void>(
                          builder: (context) => ModalFit(),
                        ),
                      ),
                    ),
                    SizedBox(height: 60)
                  ],
                ),
              ),
            ),
          ),
          navigationBar: CupertinoNavigationBar(
            transitionBetweenRoutes: false,
            middle: Text('iOS13 Modal Presentation'),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  // ignore: sort_constructors_first
  const SectionTitle(
    this.title, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}

extension ListUtils<T> on List<T> {
  List<T> addItemInBetween(T item) => length <= 1
      ? this
      : sublist(1).fold(
          <T>[first],
          (r, element) => [...r, item, element],
        );
}
