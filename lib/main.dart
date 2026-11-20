import 'package:material_ui/material_ui.dart';

void main() => runApp(const MenuUmkmMedanApp());

class MenuUmkmMedanApp extends StatelessWidget {
  const MenuUmkmMedanApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF8D2B1B);
    return MaterialApp(
      title: 'Menu UMKM Kuliner Medan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ),
      ),
      home: const HalamanMenuUmkm(),
    );
  }
}

class HalamanMenuUmkm extends StatelessWidget {
  const HalamanMenuUmkm({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuliner Medan'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Promo paket hemat tersedia setiap hari!')),
          );
        },
        icon: const Icon(Icons.local_offer_outlined),
        label: const Text('Promo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/banner_kuliner.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text('Dapur Bunda Medan', style: teks.headlineSmall),
            const SizedBox(height: 4),
            Text(
              'Menyajikan hidangan rumahan khas Medan dengan bumbu rempah pilihan.',
              style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
            ),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Semua menu dimasak segar setiap pagi.')),
                );
              },
              icon: const Icon(Icons.verified_outlined),
              label: const Text('Jaminan Fresh'),
            ),
            const SizedBox(height: 16),
            Text('Informasi Kontak', style: teks.titleMedium),
            const SizedBox(height: 8),
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('Jl. Dr. Mansyur No. 45, Medan'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.phone_outlined),
                    title: Text('+62 812-6500-1234'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.schedule_outlined),
                    title: Text('Buka Setiap Hari: 08.00 - 21.00 WIB'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text('Daftar Menu', style: teks.titleMedium),
            const SizedBox(height: 8),
            const KartuMenu(
              nama: 'Lontong Medan Komplit',
              harga: 'Rp18.000',
              kategori: 'Sarapan',
            ),
            const KartuMenu(
              nama: 'Nasi Goreng Terasi Medan',
              harga: 'Rp22.000',
              kategori: 'Utama',
            ),
            const KartuMenu(
              nama: 'Mie Gomak Kuah Santan',
              harga: 'Rp20.000',
              kategori: 'Berkuah',
            ),
            const KartuMenu(
              nama: 'Es Teh Susu Telur',
              harga: 'Rp15.000',
              kategori: 'Minuman',
            ),
          ],
        ),
      ),
    );
  }
}

class KartuMenu extends StatelessWidget {
  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final String harga;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(nama, style: teks.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(harga, style: teks.bodyMedium),
              Chip(label: Text(kategori)),
            ],
          ),
        ),
        trailing: TombolFavoritMenu(namaMenu: nama),
      ),
    );
  }
}

class TombolFavoritMenu extends StatefulWidget {
  const TombolFavoritMenu({super.key, required this.namaMenu});

  final String namaMenu;

  @override
  State<TombolFavoritMenu> createState() => _TombolFavoritMenuState();
}

class _TombolFavoritMenuState extends State<TombolFavoritMenu> {
  bool _isFavorit = false;

  void _toggleFavorit() {
    setState(() {
      _isFavorit = !_isFavorit;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorit
              ? '${widget.namaMenu} ditambahkan ke favorit'
              : '${widget.namaMenu} dihapus dari favorit',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorit,
      icon: Icon(
        _isFavorit ? Icons.favorite : Icons.favorite_border,
      ),
      tooltip: _isFavorit ? 'Hapus favorit' : 'Tandai favorit',
    );
  }
}