import 'package:flutter/material.dart';
import 'package:newa2_flutter/src/pages/tab1_page.dart';
import 'package:newa2_flutter/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
   ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: const [
        BottomNavigationBarItem( icon: Icon( Icons.person_outline ), label: 'Para ti' ),
        BottomNavigationBarItem( icon: Icon( Icons.public ), label: 'Encabezados'),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[

        const Tab1Page(),

        Tab2Page()

      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;
  final PageController _pageController = PageController();


  int get paginaActual => _paginaActual;
  
  set paginaActual( int valor ) {
    _paginaActual = valor;

    _pageController.animateToPage(valor, duration: const Duration(milliseconds: 250), curve: Curves.easeOut );

    notifyListeners();
  }

  PageController get pageController => _pageController;

}