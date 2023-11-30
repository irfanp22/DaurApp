import 'package:daur_app/interface/widget/white_space_widget.dart';
import 'package:flutter/material.dart';

class TndScreen extends StatelessWidget {
  const TndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Syarat dan Ketentuan'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WhiteSpaceWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Syarat dan Ketentuan Penggunaan',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Dengan menggunakan aplikasi ini, Anda setuju untuk mematuhi syarat dan ketentuan berikut:',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  '1. Penggunaan aplikasi ini harus sesuai dengan hukum yang berlaku.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '2. Penggunaan aplikasi ini bertanggung jawab atas informasi yang diberikan.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '3. Dilarang keras untuk menggunakan aplikasi ini untuk kegiatan ilegal atau melanggar etika.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '4. Setiap pengguna wajib menjaga kerahasiaan informasi akun pribadi.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '5. Tidak diperkenankan menggunakan aplikasi ini untuk tujuan komersial tanpa izin tertulis.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '6. Aplikasi ini dapat mengumpulkan data pengguna untuk tujuan analisis dan peningkatan layanan.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '7. Penggunaan aplikasi ini dianggap penerimaan sepenuhnya terhadap syarat dan ketentuan ini.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                // ... tambahkan lebih banyak syarat dan ketentuan jika diperlukan
              ],
            ),
          ),
        ],
      ),
    );
  }
}
