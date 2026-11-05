@extends('layouts.app')

@section('title', '403 - Akses Ditolak')

@section('content')
    <div class="row justify-content-center py-5">
        <div class="col-md-8 col-lg-6 text-center">
            <div class="card border-0 shadow-sm p-4 p-md-5">
                <div class="mb-4">
                    <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-danger-subtle text-danger" style="width: 80px; height: 80px;">
                        <i class="bi bi-shield-x fs-1"></i>
                    </div>
                </div>
                <h1 class="display-5 fw-bold text-danger mb-2">403</h1>
                <h2 class="h4 fw-semibold mb-3">Akses Ditolak</h2>
                <p class="text-body-secondary mb-4">
                    {{ $exception->getMessage() ?: 'Anda tidak memiliki hak akses untuk membuka halaman ini.' }}
                </p>
                <div>
                    <a href="{{ route('dashboard') }}" class="btn btn-primary px-4">
                        <i class="bi bi-house-door me-1"></i> Kembali ke Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection

