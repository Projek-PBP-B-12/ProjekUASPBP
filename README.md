# TitikLapar Mobile - Projek UAS PBP B Kelompok 12

## Nama dan NPM Anggota Kelompok

1. **GHULAM MUHAMMAD IHSAN** : `2506656766`
2. **Muh. Agra Putra Davyza Chaniago** : `2506624833`
3. **ANINDYA RAIHANI HASSAN** : `2506553295`
4. **ILMAN ZIDNI** : `2506621951`
5. **JUSTIN EVAN HALIM SAPUTRA** : `2506549386`

---

## Deskripsi Aplikasi

**TitikLapar** adalah aplikasi mobile berbasis Flutter yang berfungsi sebagai **Personal Food Tracker & Papan Pengumuman Spasial** untuk menekan angka *food waste*.

Aplikasi ini berangkat dari permasalahan masyarakat, khususnya mahasiswa yang tinggal di kos dan sering menyimpan makanan di kulkas bersama. Karena jumlah makanan yang disimpan cukup banyak serta lamanya waktu penyimpanan tidak terdata dengan baik, makanan sering kali terlupakan hingga melewati tanggal kedaluwarsa.

Melalui **TitikLapar**, pengguna dapat:

- Mencatat inventori makanan pribadi dengan memasukkan nama, kategori, tanggal pembelian, tanggal kedaluwarsa, serta URL foto opsional (tanggal pembelian dan kedaluwarsa yang dikosongkan menggunakan tanggal hari ini sebagai nilai bawaan).
- Memantau sisa hari menuju tanggal kedaluwarsa secara otomatis.
- Menerima pengingat (*notification*) saat makanan mendekati masa kedaluwarsa (H-7, H-3, dan H-1).
- Mengonsumsi makanan segera atau membagikannya secara gratis melalui **Papan Berbagi** terintegrasi yang terhubung dengan peta spasial agar makanan layak konsumsi dapat diklaim oleh pengguna lain di sekitar mereka secara *peer-to-peer*, menciptakan ekosistem sirkular yang saling menguntungkan dan ramah lingkungan.

---

## Daftar Modul dan Pembagian Kerja

### 1. UserProfile

**Penanggung jawab modul**: Ghulam Muhammad Ihsan

Modul `UserProfile` berperan sebagai fondasi identitas dan pusat komunikasi antar pengguna di dalam aplikasi. Modul ini mengelola data autentikasi akun (`username`, `email`, dan kata sandi) serta kontak eksternal (nomor WhatsApp dan ID Line) yang diperlukan untuk koordinasi pengambilan makanan secara mandiri. Selain itu, `UserProfile` menyimpan preferensi lokasi bawaan (*default location*) pengguna agar tampilan peta dan perhitungan jarak/radius dapat langsung terpusat tanpa harus selalu menunggu akses GPS perangkat.

**Aktivitas pengguna**: mendaftar akun, login, logout, melihat/memperbarui kontak WhatsApp/Line dan lokasi bawaan, melihat kontak donor, serta menghapus akun.

- **Create**: Registrasi akun baru dan pembuatan profil pengguna.
- **Read**: Melihat profil sendiri dan melihat detail kontak donor (WhatsApp/Line).
- **Update**: Mengubah email, kontak WhatsApp/Line, serta lokasi bawaan.
- **Delete**: Menghapus akun beserta profil dan data terkait setelah verifikasi kata sandi.

### 2. FoodItem

**Penanggung jawab modul**: Ilman Zidni

Modul `FoodItem` mengelola inventori makanan pribadi milik pengguna. Data yang disimpan mencakup nama makanan, kategori, tanggal pembelian, tanggal kedaluwarsa, dan URL foto opsional. Sistem menghitung sisa hari menuju kedaluwarsa sebagai indikator penanda pada inventori dan acuan pembuatan pengingat. Status makanan membedakan item yang sedang tersimpan (`STORED`), sedang ditawarkan di papan berbagi (`OFFERED`), atau sudah habis (`CONSUMED`).

**Aktivitas pengguna**: mencatat makanan, mencari dan menyaring inventori, melihat detail serta sisa hari sebelum kedaluwarsa, mengubah status makanan (habis/simpan kembali), atau membagikannya melalui `SharedPost`.

- **Create**: Menambahkan item makanan beserta nama, kategori, tanggal pembelian/kedaluwarsa, dan URL foto opsional.
- **Read**: Melihat daftar dan detail makanan milik sendiri, mencari berdasarkan nama, menyaring berdasarkan status, serta melihat penanda sisa hari kedaluwarsa.
- **Update**: Mengedit informasi makanan, menandai sudah habis (`CONSUMED`), atau menyimpan kembali (`STORED`). Publikasi ke `SharedPost` otomatis mengubah status menjadi `OFFERED`.
- **Delete**: Menghapus makanan milik sendiri beserta penawaran `SharedPost` yang terkait.

### 3. SharedPost

**Penanggung jawab modul**: Justin Evan Halim Saputra

Modul `SharedPost` merepresentasikan penawaran makanan di papan berbagi. Entitas ini terhubung langsung dengan `FoodItem` dan `Location` untuk menampilkan penawaran aktif yang masih layak konsumsi (belum kedaluwarsa) pada daftar papan berbagi maupun sebagai pin pada peta. Pemisahan ini menjaga agar data inventori pribadi tidak tercampur dengan kueri penawaran publik, sekaligus menyimpan deskripsi/petunjuk pengambilan dari pendonor dan memantau status keaktifan agar penawaran segera disembunyikan saat makanan sudah diambil.

**Aktivitas pengguna**: pendonor mempublikasikan makanan yang ingin dibagikan, mengelola penawaran aktif, dan menandai penawaran selesai; pencari melihat penawaran, menyaring kategori/area, dan menghubungi pendonor.

- **Create**: Mempublikasikan `FoodItem` berstatus `STORED` ke papan berbagi dengan memilih `Location` dan mengisi deskripsi pengambilan.
- **Read**: Melihat daftar penawaran aktif (semua maupun milik sendiri), halaman detail penawaran, serta melakukan pencarian dan filter kategori.
- **Update**: Mengedit deskripsi pengambilan atau lokasi pada penawaran aktif, serta menandai penawaran sudah selesai/diambil (`complete`).
- **Delete**: Membatalkan/menghapus penawaran aktif (mengembalikan status `FoodItem` menjadi `STORED`).

### 4. Location

**Penanggung jawab modul**: Anindya Raihani Hassan

Modul `Location` menangani pengelolaan titik lokasi tersimpan milik pengguna (koordinat *Latitude*, *Longitude*, dan nama area umum seperti nama kecamatan untuk menjaga privasi alamat persis) serta penyediaan data pin spasial untuk peta. Dengan normalisasi data lokasi sebagai entitas tersendiri, `SharedPost` cukup mereferensikan `Location` sehingga titik koordinat tersimpan terpusat dan daftar pin peta dapat dimuat secara ringan serta dilengkapi informasi jarak dari lokasi bawaan pengguna.

**Aktivitas pengguna**: menambahkan lokasi pengambilan (input koordinat, pencarian area melalui Nominatim, atau GPS perangkat), mengatur lokasi bawaan, dan melihat sebaran penawaran makanan di peta.

- **Create**: Menyimpan lokasi pengambilan baru milik pengguna.
- **Read**: Melihat daftar lokasi tersimpan milik sendiri serta mengambil data pin penawaran aktif (`/api/locations/pins/`) untuk ditampilkan pada peta.
- **Update**: Mengubah koordinat atau nama area lokasi yang belum direferensikan penawaran, serta menetapkan lokasi sebagai lokasi bawaan (`set_default`).
- **Delete**: Menghapus lokasi tersimpan yang tidak lagi digunakan oleh penawaran mana pun.

### 5. Notification

**Penanggung jawab modul**: Muh. Agra Putra Davyza Chaniago

Modul `Notification` menyimpan dan menampilkan riwayat pengingat makanan milik pengguna untuk makanan berstatus `STORED` atau `OFFERED` pada **H-7**, **H-3**, dan **H-1** sebelum tanggal kedaluwarsa. Setiap notifikasi mencatat pesan pengingat, waktu pembuatan, tanggal kedaluwarsa acuan, status baca (`is_read`), serta status pemrosesan email.

**Aktivitas pengguna**: melihat daftar pengingat makanan milik sendiri, memantau jumlah notifikasi yang belum dibaca, menyegarkan pengingat, dan menandai notifikasi sebagai sudah dibaca.

- **Create**: Sistem menghasilkan pengingat secara otomatis saat sisa waktu makanan mencapai 7, 3, atau 1 hari sebelum kedaluwarsa (termasuk saat sinkronisasi/refresh notifikasi).
- **Read**: Melihat daftar notifikasi milik sendiri dan jumlah pesan belum dibaca (`unread-count`).
- **Update**: Menandai notifikasi tertentu sebagai sudah dibaca (`read`).
- **Delete**: Riwayat notifikasi otomatis terhapus saat akun penerima dihapus (`CASCADE`), dan tetap tersimpan dengan referensi makanan dikosongkan (`SET_NULL`) apabila item makanan dihapus.

---

## Peran atau Aktor Pengguna Aplikasi

- **Guest (Belum Login)**:
  Dapat mengakses halaman pembuka (*landing*) serta melakukan registrasi akun baru atau masuk ke dalam aplikasi.
- **User (Setelah Login)**:
  Aktor utama aplikasi yang berperan ganda sesuai kebutuhan:
  - Sebagai **Pemilik Inventori / Pendonor**: mengelola inventori makanan pribadi (`FoodItem`), mengatur profil dan kontak (`UserProfile`), mengelola daftar lokasi (`Location`), memantau pengingat kedaluwarsa (`Notification`), serta mempublikasikan dan menyelesaikan penawaran di papan berbagi (`SharedPost`).
  - Sebagai **Pencari Makanan**: menelusuri daftar penawaran pada papan berbagi maupun peta interaktif, melihat detail makanan dan lokasi area, serta menghubungi kontak WhatsApp/Line pendonor untuk koordinasi pengambilan.
- **Admin**:
  Mengelola data pengguna serta memoderasi penawaran/pengumuman yang tidak pantas melalui panel administrasi backend Django.

**Alur Singkat Penggunaan**:
Pengguna mencatat makanan yang dibeli pada menu inventori pribadi. Ketika mendekati masa kedaluwarsa dan menerima notifikasi pengingat, jika pengguna tidak sempat menghabiskannya, makanan dapat dipublikasikan ke **Papan Berbagi** dengan memilih lokasi pengambilan. Pengguna lain dapat melihat sebaran makanan gratis tersebut melalui daftar papan berbagi atau peta interaktif, membuka detail penawaran, lalu menekan tombol kontak donor untuk berkomunikasi langsung via aplikasi pesan singkat (WhatsApp/Line). Setelah makanan berpindah tangan, pendonor menandai penawaran sebagai sudah diambil.

---

## Alur Pengintegrasian Data (Mobile Flutter & Web PWS via Django REST Framework)

Aplikasi mobile Flutter terintegrasi secara langsung dengan situs web **TitikLapar** dari Proyek Tengah Semester yang berjalan pada server PWS (`https://justin-evan-titiklapar.pws.cs.ui.ac.id/`) melalui *web service* **Django REST Framework (DRF)**.

```text
+--------------------+     HTTP / JSON (Token Auth)     +----------------------------------+
|   Aplikasi Mobile  | <==============================> |     Backend Django + DRF (PWS)   |
|      (Flutter)     |   Authorization: Token <key>     | justin-evan-titiklapar.pws...    |
+--------------------+                                  +----------------------------------+
                                                                   ^            |
                                        HTTP / HTML / HTMX         |            v
+--------------------+ <===========================================+   +--------------------+
|   Situs Web (PWS)  |                                                 |     PostgreSQL     |
| (Django Templates) |                                                 |   (Basis Data)     |
+--------------------+                                                 +--------------------+
```

Berikut alur pengintegrasian data antara aplikasi mobile dan backend web PWS:

1. **Penyediaan Web Service dengan Django REST Framework (DRF)**
   Backend Proyek Tengah Semester mengekspos endpoint REST API di bawah prefix `/api/` menggunakan `rest_framework` dan `rest_framework.authtoken`. Seluruh pertukaran data menggunakan format JSON (`JSONRenderer`) serta mendukung paginasi terstandar (`PageNumberPagination` dengan ukuran halaman bawaan 20 item).
2. **Autentikasi & Manajemen Sesi (`TokenAuthentication` / `SessionAuthentication`)**

   - Pengguna melakukan registrasi melalui `POST /api/auth/register/` atau login melalui `POST /api/auth/login/` dari aplikasi Flutter.
   - Ketika kredensial valid, DRF mengembalikan respons JSON berisi `token`, `user_id`, dan `username`.
   - Aplikasi Flutter menyimpan token autentikasi tersebut di sesi klien dan menyertakannya pada header `Authorization: Token <token_key>` di setiap permintaan ke endpoint yang memerlukan otorisasi (`IsAuthenticated`).
   - Saat pengguna logout (`POST /api/auth/logout/`), server menghapus token pengguna dari database.
3. **Serialisasi, Validasi, dan Pemetaan Endpoint per Modul**
   Setiap modul pada backend Django menyediakan `Serializer` dan `ViewSet`/`APIView` untuk memvalidasi payload JSON dari Flutter serta mengubah objek model database menjadi respons JSON:

   - **UserProfile**:
     - `POST /api/auth/register/` — registrasi akun
     - `POST /api/auth/login/` — login dan perolehan token
     - `POST /api/auth/logout/` — logout dan penghapusan token
     - `GET / PATCH / PUT / DELETE /api/profile/` — lihat, perbarui profil/kontak/lokasi bawaan, atau hapus akun
     - `GET /api/contacts/<user_id>/` — ambil kontak donor (WhatsApp/Line)
   - **FoodItem**:
     - `GET / POST /api/foods/` — daftar inventori pribadi (mendukung pencarian & pengurutan) dan tambah makanan
     - `GET / PUT / PATCH / DELETE /api/foods/<id>/` — detail, edit, dan hapus makanan
     - `POST /api/foods/<id>/status/` — ubah status makanan (`STORED` / `CONSUMED`)
   - **SharedPost**:
     - `GET / POST /api/posts/` — daftar penawaran aktif (mendukung parameter `?mine=1`, `?category=`, pencarian, dan pengurutan) serta publikasi penawaran baru
     - `GET / PUT / PATCH / DELETE /api/posts/<id>/` — detail, perbarui deskripsi/lokasi penawaran, atau batalkan penawaran
     - `POST /api/posts/<id>/complete/` — tandai penawaran sudah diambil (`CONSUMED`)
   - **Location**:
     - `GET / POST /api/locations/` — daftar lokasi tersimpan milik sendiri dan tambah lokasi baru
     - `GET / PUT / PATCH / DELETE /api/locations/<id>/` — detail, ubah, atau hapus lokasi tersimpan
     - `POST /api/locations/<id>/set_default/` — tetapkan lokasi sebagai lokasi bawaan profil
     - `GET /api/locations/pins/` — ambil data pin penawaran aktif beserta jarak relatif terhadap lokasi bawaan untuk dirender di peta
   - **Notification**:
     - `GET /api/notifications/` — daftar notifikasi pengguna (sekaligus memicu pengecekan pengingat yang memenuhi syarat)
     - `POST /api/notifications/<id>/read/` — tandai notifikasi telah dibaca
     - `GET /api/notifications/unread-count/` — jumlah notifikasi belum dibaca
     - `POST /api/notifications/refresh/` — segarkan pembuatan pengingat akun terkait
4. **Konsumsi Data pada Aplikasi Flutter & Sinkronisasi Real-Time antar Platform**
   Aplikasi Flutter mengirimkan HTTP request (`GET`, `POST`, `PUT`, `PATCH`, `DELETE`) ke endpoint DRF di server PWS, mengurai (*parse*) payload JSON ke dalam model data Dart masing-masing modul, lalu memperbarui tampilan antarmuka secara reaktif. Karena aplikasi mobile dan situs web mengakses backend dan basis data PostgreSQL yang sama di PWS, setiap penambahan, pembaruan, publikasi penawaran, atau perubahan status dari perangkat mobile langsung tercermin di situs web, begitu pula sebaliknya.

### Sumber / Dokumentasi Public API Pendukung

1. **OpenStreetMap (OSM) & Leaflet.js**: Layanan data peta dan antarmuka peta interaktif untuk menampilkan sebaran titik lokasi penawaran makanan.
   Dokumentasi: https://leafletjs.com/reference.html
2. **Nominatim API**: Layanan geocoding OpenStreetMap untuk mengubah teks nama area/alamat menjadi koordinat spasial (*Latitude*/*Longitude*).
   Dokumentasi: https://nominatim.org/release-docs/latest/api/Overview/

---

## Tautan Desain Figma

https://www.figma.com/design/r3aIEwY6EmWnxDocq8Rrl3/Projek-PBP-B12?node-id=0-1&t=RJOL7DroOzRv7Kqf-1

---

## Tautan Deployment PWS & APK

- **Tautan Situs Web (PWS)**: https://justin-evan-titiklapar.pws.cs.ui.ac.id/
- **Tautan APK**: *Akan ditambahkan setelah Checkpoint 1.*
