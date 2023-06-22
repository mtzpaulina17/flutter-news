import 'package:flutter/material.dart';
import 'package:newa2_flutter/src/services/news_service.dart';
import 'package:newa2_flutter/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab1Page extends StatefulWidget {
  const Tab1Page({super.key});


  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    return Scaffold(
      body: ( headlines.isEmpty )
          ? const Center(child: CircularProgressIndicator())
          : ListaNoticias( headlines )
   );
  }

  @override
  bool get wantKeepAlive => true;
}