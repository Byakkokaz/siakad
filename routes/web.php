<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\BerandaController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\KrsController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\MataKuliahController;
use App\Http\Controllers\PenggunaController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'authenticate'])->name('login.attempt');
});

Route::middleware(['auth', 'prevent-back-history'])->group(function () {
    Route::get('/', fn () => redirect()->route('dashboard'));

    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');
        
    Route::get('/beranda', [BerandaController::class, 'index'])->name('beranda');

    // 1) Endpoint JSON DataTables 
    Route::get('/dosen/data', [DosenController::class, 'data'])->name('dosen.data');
    Route::get('/mahasiswa/data', [MahasiswaController::class, 'data'])->name('mahasiswa.data');
    Route::get('/mata-kuliah/data', [MataKuliahController::class, 'data'])->name('matakuliah.data');
    Route::get('/krs/data', [KrsController::class, 'data'])->name('krs.data');

    // 2) Tambah, ubah, hapus: khusus admin
    Route::middleware('role:admin')->group(function () {
        Route::resource('dosen', DosenController::class)
            ->except(['index', 'show']);
            
        Route::resource('mahasiswa', MahasiswaController::class)
            ->except(['index', 'show']);
            
        Route::resource('matakuliah', MataKuliahController::class)
            ->parameters(['matakuliah' => 'mataKuliah'])
            ->except(['index', 'show']);

        Route::resource('krs', KrsController::class)
            ->parameters(['krs' => 'krs'])
            ->except(['index', 'show']);
    });

    // 3) Daftar dan detail: semua pengguna yang sudah login
    Route::resource('dosen', DosenController::class)
        ->only(['index', 'show']);
        
    Route::resource('mahasiswa', MahasiswaController::class)
        ->only(['index', 'show']);
        
    Route::resource('matakuliah', MataKuliahController::class)
        ->parameters(['matakuliah' => 'mataKuliah'])
        ->only(['index', 'show']);

    Route::resource('krs', KrsController::class)
        ->parameters(['krs' => 'krs'])
        ->only(['index', 'show']);

    Route::get('/pengguna', [PenggunaController::class, 'index'])
        ->middleware('role:admin')
        ->name('pengguna.index');
});