import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tentang Kami'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WhiteSpaceWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/logodaur.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'DaurApp',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Versi 1.0.0',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Selamat datang di aplikasi DaurApp. Aplikasi ini bertujuan untuk memudahkan partisipasi masyarakat dalam mendaur ulang sampah.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Tim Pengembang:',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Anisa Meilia',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Irfan Priatna',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Nurul Afifah',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Fachrubi Annafi',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
