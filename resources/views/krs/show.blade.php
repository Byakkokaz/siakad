@extends('layouts.app')

@section('title', 'Detail KRS')

@section('content')
    <x-page-header judul="Detail KRS" deskripsi="Informasi lengkap Kartu Rencana Studi mahasiswa." />

    @php
        $warnaStatus = match ($krs->status) {
            'disetujui' => 'success',
            'diajukan'  => 'warning',
            'ditolak'   => 'danger',
            default     => 'secondary',
        };
        $totalSks = $krs->mataKuliah->sum('sks');
    @endphp

    <div class="card border-0 shadow-sm mb-4">
        <div class="card-header bg-body fw-semibold d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center gap-2">
                <i class="bi bi-journal-check text-primary"></i>
                <span>KRS: {{ $krs->mahasiswa->nama ?? '-' }} ({{ $krs->mahasiswa->nim ?? '-' }})</span>
            </div>
            <span class="badge text-bg-{{ $warnaStatus }} fs-6">
                {{ ucfirst($krs->status) }}
            </span>
        </div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">NIM</p>
                    <p class="fw-semibold mb-0">{{ $krs->mahasiswa->nim ?? '-' }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Nama Mahasiswa</p>
                    <p class="fw-semibold mb-0">{{ $krs->mahasiswa->nama ?? '-' }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Program Studi</p>
                    <p class="fw-semibold mb-0">{{ $krs->mahasiswa->program_studi ?? '-' }}</p>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <p class="text-body-secondary small mb-1">Angkatan</p>
                    <p class="fw-semibold mb-0">{{ $krs->mahasiswa->angkatan ?? '-' }}</p>
                </div>

                <div class="col-12"><hr class="my-1"></div>

                <div class="col-sm-6 col-lg-4">
                    <p class="text-body-secondary small mb-1">Tahun Akademik</p>
                    <p class="fw-semibold mb-0">{{ $krs->tahun_akademik }}</p>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <p class="text-body-secondary small mb-1">Semester</p>
                    <p class="fw-semibold mb-0">{{ $krs->semester }}</p>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <p class="text-body-secondary small mb-1">Total Beban SKS</p>
                    <p class="fw-semibold text-primary mb-0 fs-5">{{ $totalSks }} SKS</p>
                </div>
            </div>
        </div>
    </div>

    <div class="card border-0 shadow-sm mb-4">
        <div class="card-header bg-body fw-semibold d-flex align-items-center justify-content-between">
            <span>Daftar Mata Kuliah yang Diambil</span>
            <span class="badge bg-primary">{{ count($krs->mataKuliah) }} Mata Kuliah</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th scope="col" style="width: 60px" class="text-center">No.</th>
                            <th scope="col">Kode MK</th>
                            <th scope="col">Nama Mata Kuliah</th>
                            <th scope="col" class="text-center" style="width: 120px">SKS</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($krs->mataKuliah as $mk)
                            <tr>
                                <td class="text-center">{{ $loop->iteration }}</td>
                                <td><span class="badge text-bg-secondary">{{ $mk->kode_mk }}</span></td>
                                <td class="fw-medium">{{ $mk->nama_mk }}</td>
                                <td class="text-center fw-semibold">{{ $mk->sks }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-center text-body-secondary py-4">
                                    Belum ada mata kuliah yang diambil pada KRS ini.
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                    @if (count($krs->mataKuliah) > 0)
                        <tfoot class="table-light">
                            <tr>
                                <th colspan="3" class="text-end">Total SKS Diambil:</th>
                                <th class="text-center text-primary">{{ $totalSks }} SKS</th>
                            </tr>
                        </tfoot>
                    @endif
                </table>
            </div>
        </div>
    </div>

    <div>
        <a href="{{ route('krs.index') }}" class="btn btn-outline-secondary">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
        @if (Auth::user()->role === 'admin')
            <a href="{{ route('krs.edit', $krs) }}" class="btn btn-warning">
                <i class="bi bi-pencil-square"></i> Ubah
            </a>
        @endif
    </div>
@endsection

