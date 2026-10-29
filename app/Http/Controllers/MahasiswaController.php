<?php

namespace App\Http\Controllers;

use Illuminate\View\View;
use Illuminate\Http\Request;

class MahasiswaController extends Controller
{
    public function index(): View
    {
        $kolom = [
            'nim'      => 'NIM',
            'nama'     => 'Nama Lengkap',
            'angkatan' => 'Angkatan',
            'email'    => 'Email',
            'status'   => 'Status',
        ];

        $mahasiswa = [
            ['nim' => '2401001', 'nama' => 'Ahmad Fauzi',    'angkatan' => 2024,
             'email' => 'ahmad.fauzi@contoh.ac.id',    'status' => 'Aktif'],
            ['nim' => '2401002', 'nama' => 'Siti Rahmawati', 'angkatan' => 2024,
             'email' => 'siti.rahmawati@contoh.ac.id', 'status' => 'Aktif'],
            ['nim' => '2301005', 'nama' => 'Budi Santoso',   'angkatan' => 2023,
             'email' => 'budi.santoso@contoh.ac.id',   'status' => 'Aktif'],
            ['nim' => '2301012', 'nama' => 'Dewi Lestari',   'angkatan' => 2023,
             'email' => 'dewi.lestari@contoh.ac.id',   'status' => 'Drop Out'],
            ['nim' => '2201020', 'nama' => 'Rizky Pratama',  'angkatan' => 2022,
             'email' => 'rizky.pratama@contoh.ac.id',  'status' => 'Lulus'],
        ];

        return view('mahasiswa.index', compact('kolom', 'mahasiswa'));
    }

    public function show($nim)
    {
        // Simulasi data pencarian (dalam praktiknya akan memanggil database)
        $mahasiswaDummy = [
            '2401001' => ['nama' => 'Ahmad Fauzi',    'angkatan' => 2024,
                          'email' => 'ahmad.fauzi@contoh.ac.id',
                          'prodi' => 'D3 Teknik Informatika', 'jk' => 'Laki-laki',
                          'telp'  => '081234567890',
                          'alamat' => 'Jl. Merdeka No. 1, Jakarta', 'status' => 'Aktif'],
            '2401002' => ['nama' => 'Siti Rahmawati', 'angkatan' => 2024,
                          'email' => 'siti.rahmawati@contoh.ac.id',
                          'prodi' => 'D3 Teknik Informatika', 'jk' => 'Perempuan',
                          'telp'  => '082345678901',
                          'alamat' => 'Jl. Sudirman No. 5, Bandung', 'status' => 'Aktif'],
            '2301005' => ['nama' => 'Budi Santoso',   'angkatan' => 2023,
                          'email' => 'budi.santoso@contoh.ac.id',
                          'prodi' => 'D3 Teknik Informatika', 'jk' => 'Laki-laki',
                          'telp'  => '083456789012',
                          'alamat' => 'Jl. Diponegoro No. 10, Surabaya', 'status' => 'Aktif'],
            '2301012' => ['nama' => 'Dewi Lestari',   'angkatan' => 2023,
                          'email' => 'dewi.lestari@contoh.ac.id',
                          'prodi' => 'D3 Teknik Informatika', 'jk' => 'Perempuan',
                          'telp'  => '084567890123',
                          'alamat' => 'Jl. Gajah Mada No. 7, Yogyakarta', 'status' => 'Drop Out'],
            '2201020' => ['nama' => 'Rizky Pratama',  'angkatan' => 2022,
                          'email' => 'rizky.pratama@contoh.ac.id',
                          'prodi' => 'D3 Teknik Informatika', 'jk' => 'Laki-laki',
                          'telp'  => '085678901234',
                          'alamat' => 'Jl. Ahmad Yani No. 3, Medan', 'status' => 'Lulus'],
        ];

        if (!array_key_exists($nim, $mahasiswaDummy)) {
            abort(404); // Tampilkan 404 jika NIM tidak ada
        }

        return view('mahasiswa.show', [
            'nim'  => $nim,
            'data' => $mahasiswaDummy[$nim],
        ]);
    }
}
