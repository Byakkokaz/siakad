@extends('layouts.app')

@section('title', 'Detail Mahasiswa – ' . $nim)

@section('content')
    <x-page-header judul="Detail Mahasiswa">
        <a href="{{ route('mahasiswa.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left me-1"></i> Kembali
        </a>
    </x-page-header>

    @php
        $warnaBadge = match ($data['status']) {
            'Aktif'    => 'success',
            'Lulus'    => 'primary',
            'Cuti'     => 'warning',
            'Drop Out' => 'danger',
            default    => 'secondary',
        };
    @endphp

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-body fw-semibold d-flex align-items-center gap-2">
            <i class="bi bi-person-lines-fill text-primary"></i>
            Informasi Mahasiswa
        </div>
        <div class="card-body">
            <div class="row g-3">
                {{-- Baris 1 --}}
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">NIM</p>
                    <p class="fw-semibold mb-0">{{ $nim }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Nama Lengkap</p>
                    <p class="fw-semibold mb-0">{{ $data['nama'] }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Angkatan</p>
                    <p class="fw-semibold mb-0">{{ $data['angkatan'] }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Status</p>
                    <p class="mb-0">
                        <span class="badge text-bg-{{ $warnaBadge }}">
                            {{ $data['status'] }}
                        </span>
                    </p>
                </div>

                <div class="col-12"><hr class="my-1"></div>

                {{-- Baris 2 --}}
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Program Studi</p>
                    <p class="fw-semibold mb-0">{{ $data['prodi'] }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Jenis Kelamin</p>
                    <p class="fw-semibold mb-0">{{ $data['jk'] }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Email</p>
                    <p class="fw-semibold mb-0">
                        <a href="mailto:{{ $data['email'] }}">{{ $data['email'] }}</a>
                    </p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Telepon</p>
                    <p class="fw-semibold mb-0">{{ $data['telp'] }}</p>
                </div>
                <div class="col-12">
                    <p class="text-body-secondary small mb-1">Alamat</p>
                    <p class="fw-semibold mb-0">{{ $data['alamat'] }}</p>
                </div>
            </div>
        </div>
    </div>
@endsection
