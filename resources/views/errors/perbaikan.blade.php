@extends('layouts.guest')

@section('title', 'Sedang Dalam Perbaikan')

@section('content')
    <div class="text-center mb-4">
        <i class="bi bi-mortarboard-fill display-5 text-primary"></i>
        <h1 class="h3 fw-bold mb-1">{{ config('app.name') }}</h1>
        <p class="text-body-secondary mb-0">Politeknik Negeri Pontianak</p>
    </div>

    <div class="card border-0 shadow-sm text-center p-4">
        <div class="mb-4">
            <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-warning-subtle text-warning" style="width: 80px; height: 80px;">
                <i class="bi bi-tools fs-1"></i>
            </div>
        </div>
        <h1 class="h4 fw-bold mb-2">Sedang Dalam Perbaikan</h1>
        <p class="text-body-secondary mb-4">
            Mohon maaf, sistem SIAKAD saat ini sedang dalam pemeliharaan berkala untuk peningkatan layanan. Silakan coba beberapa saat lagi.
        </p>

        @if (!empty($retryAfter))
            <p class="small text-muted mb-3">
                <i class="bi bi-clock-history me-1"></i>
                Perkiraan selesai dalam {{ $retryAfter }} detik.
            </p>
        @endif

        <div class="alert alert-warning d-flex align-items-center justify-content-center gap-2 mb-0 py-2 small" role="alert">
            <i class="bi bi-exclamation-triangle-fill"></i>
            <div>Layanan akan segera aktif kembali normal.</div>
        </div>
    </div>
@endsection
