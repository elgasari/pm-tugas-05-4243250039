# Tugas Rutin 5 — Halaman Menu UMKM Kuliner Medan

## (a) Identitas
- **Nama:** Elga Sari Tanjung
- **NIM:** 4243250039
- **Kelas:** PSIK-24C

---

## (b) Tangkapan Layar Mode Terang dan Gelap

### Mode Terang
![Tangkapan Layar Mode Terang](screenshots/light_mode.jpg)

### Mode Gelap
![Tangkapan Layar Mode Gelap](screenshots/dark_mode.jpg)

---

## (c) Diagram Widget Tree

```text
MenuUmkmMedanApp [STATELESS]
└── MaterialApp (theme & darkTheme via ColorScheme.fromSeed)
    └── HalamanMenuUmkm [STATELESS]
        └── Scaffold
            ├── AppBar ("Kuliner Medan")
            ├── FloatingActionButton.extended ("Promo")
            └── SingleChildScrollView
                └── Column
                    ├── ClipRRect -> Image.asset ("assets/images/banner_kuliner.png")
                    ├── Text ("Dapur Bunda Medan")
                    ├── Text (Deskripsi singkat usaha)
                    ├── FilledButton.tonalIcon ("Jaminan Fresh")
                    ├── Text ("Informasi Kontak")
                    ├── Card -> Column
                    │   ├── ListTile (Alamat Medan)
                    │   ├── Divider
                    │   ├── ListTile (Telepon/WhatsApp)
                    │   ├── Divider
                    │   └── ListTile (Jam buka)
                    ├── Text ("Daftar Menu")
                    └── KartuMenu [STATELESS] (x4 item: nama, harga, Chip kategori)
                        └── Card -> ListTile
                            ├── Text (nama menu)
                            ├── Wrap -> [Text harga, Chip kategori]
                            └── trailing: TombolFavoritMenu [STATEFUL]
                                └── _TombolFavoritMenuState
                                    └── IconButton (ikon hati + setState + SnackBar)
```

---

## (d) Penjelasan Arsitektur Flutter

Di Flutter, antarmuka dibangun melalui komposisi tiga struktur pohon yang saling berpasangan. **Widget tree** berisi objek konfigurasi UI yang bersifat *immutable* dan dibuat ulang setiap kali metode `build()` dipanggil untuk menggambarkan tampilan yang diinginkan. **Element tree** bertindak sebagai jembatan yang bertahan antar-*rebuild*, mencocokkan widget baru dengan yang lama berdasarkan tipe dan *key*, menyimpan objek `State`, sekaligus menjadi `BuildContext`. Selanjutnya, **Render tree** (`RenderObject tree`) mengelola perhitungan ukuran dan posisi (*layout*) serta proses menggambar (*paint*) ke layar melalui *engine*. Ketika `setState()` dipanggil, Flutter menandai *element* terkait sebagai kotor, memanggil ulang `build()`, lalu memakai ulang *element* serta *render object* lama yang cocok agar pembaruan UI tetap efisien.

Pada aplikasi ini, `MenuUmkmMedanApp`, `HalamanMenuUmkm`, dan `KartuMenu` dirancang sebagai `StatelessWidget` karena tampilannya hanya bergantung pada konfigurasi tema atau parameter masuk seperti nama, harga, dan kategori menu tanpa mengubah *state* internal. Sebaliknya, `TombolFavoritMenu` dibuat sebagai `StatefulWidget` kecil agar perubahan status favorit (`_isFavorit`) dan kemunculan `SnackBar` hanya memicu *rebuild* pada tombol favorit tersebut tanpa membangun ulang seluruh halaman atau daftar menu.

---

## (e) Pernyataan Penggunaan AI

Saya menggunakan AI untuk membantu panduan langkah pengerjaan, contoh kode awal, penelusuran error saat menjalankan `flutter test`, serta penyusunan draf dokumentasi. Kode dan dokumentasi saya periksa, jalankan, uji, dan sesuaikan sendiri sebelum di-*push* ke repository GitHub.
```