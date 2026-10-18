<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
	<link rel="stylesheet" href="{{asset('vendor/bootstrap/css/bootstrap.min.css')}}">
	<link rel="stylesheet" href="{{asset('vendor/bootstrap-icons/bootstrap-icons.min.css')}}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $namaAplikasi }} - Beranda</title>
</head>
<body>
    <h1>{{ $namaAplikasi }}</h1>
    <p>Konfigurasi Berhasil. Hari ini {{ $waktu }}.</p>

    <table border="1" cellpadding="6" cellspacing="0">
        <tr>
            <th align="left">Laravel</th>
            <td>{{ $versiLaravel }}</td>
        </tr>
        <tr>
            <th align="left">PHP</th>
            <td>{{ $versiPhp }}</td>
        </tr>
        <tr>
            <th align="left">MySQL</th>
            <td>{{ $versiMysql }}</td>
        </tr>
        <tr>
            <th align="left">Database</th>
            <td>{{ $namaDatabase }}</td>
        </tr>

    </table>
	<i class="bi bi-house-door-fill"></i> Halaman Beranda 
	<i class="bi bi-person-fill"></i> Profil Mahasiswa
	<!-- <p><strong>Menggunakan kurung kurawal ganda @{{ }} (Aman):</strong></p>
    {{ $contohScript }}

    <br><br>

    <p><strong>Menggunakan tanda seru @{!! !!} (Berbahaya):</strong></p>
    {!! $contohScript !!} -->
	<script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    
</body>
</html>