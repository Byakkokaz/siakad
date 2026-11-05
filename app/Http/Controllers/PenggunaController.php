<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;

class PenggunaController extends Controller
{
    public function index(): View
    {
        $kolom = [
            'name'          => 'Nama',
            'email'         => 'Email',
            'role'          => 'Peran',
            'last_login_at' => 'Terakhir Login',
        ];

        $pengguna = User::orderBy('name')
            ->get(['name', 'email', 'role', 'last_login_at'])
            ->map(function ($u) {
                return [
                    'name'          => $u->name,
                    'email'         => $u->email,
                    'role'          => $u->role,
                    'last_login_at' => $u->last_login_at ? $u->last_login_at->format('Y-m-d H:i:s') : '-',
                ];
            })
            ->toArray();

        return view('pengguna.index', compact('kolom', 'pengguna'));
    }
}
