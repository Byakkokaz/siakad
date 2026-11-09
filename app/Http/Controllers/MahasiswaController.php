<?php

namespace App\Http\Controllers;

use App\Models\Mahasiswa;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class MahasiswaController extends Controller
{
    public function index(): View
    {
        return view('mahasiswa.index');
    }

    public function data(): JsonResponse
    {
        $query = Mahasiswa::query()->select([
            'id', 'nim', 'nama', 'jenis_kelamin', 'email', 'angkatan', 'program_studi'
        ]);

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (Mahasiswa $mahasiswa) {
                return view('mahasiswa._aksi', compact('mahasiswa'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('mahasiswa.create', ['mahasiswa' => new Mahasiswa()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $mahasiswa = Mahasiswa::create($this->validated($request));

        return redirect()
            ->route('mahasiswa.index')
            ->with('success', 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil ditambahkan.');
    }

    public function show(Mahasiswa $mahasiswa): View
    {
        return view('mahasiswa.show', compact('mahasiswa'));
    }

    public function edit(Mahasiswa $mahasiswa): View
    {
        return view('mahasiswa.edit', compact('mahasiswa'));
    }

    public function update(Request $request, Mahasiswa $mahasiswa): RedirectResponse
    {
        $mahasiswa->update($this->validated($request, $mahasiswa));

        return redirect()
            ->route('mahasiswa.index')
            ->with('success', 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil diperbarui.');
    }

    public function destroy(Mahasiswa $mahasiswa): JsonResponse
    {
        try {
            $mahasiswa->delete();
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Data mahasiswa tidak dapat dihapus: masih dipakai data lain (KRS).',
            ], 409);
        }

        return response()->json([
            'message' => 'Data mahasiswa ' . $mahasiswa->nama . ' berhasil dihapus.',
        ]);
    }

    private function validated(Request $request, ?Mahasiswa $mahasiswa = null): array
    {
        return $request->validate(
            [
                'nim' => ['required', 'string', 'max:20',
                    Rule::unique(Mahasiswa::class, 'nim')->ignore($mahasiswa?->id)],
                'nama' => ['required', 'string', 'max:120'],
                'jenis_kelamin' => ['required', 'string'],
                'email' => ['required', 'email', 'max:120',
                    Rule::unique(Mahasiswa::class, 'email')->ignore($mahasiswa?->id)],
                'angkatan' => ['required', 'numeric'],
                'program_studi' => ['required', 'string', 'max:100'],
            ], [
                'nim.required' => 'NIM wajib diisi.',
                'nim.max' => 'NIM maksimal 20 karakter.',
                'nim.unique' => 'NIM sudah terdaftar.',
                'nama.required' => 'Nama mahasiswa wajib diisi.',
                'nama.max' => 'Nama maksimal 120 karakter.',
                'jenis_kelamin.required' => 'Jenis kelamin wajib dipilih.',
                'email.required' => 'Email wajib diisi.',
                'email.email' => 'Format email tidak valid.',
                'email.max' => 'Email maksimal 120 karakter.',
                'email.unique' => 'Email sudah terdaftar.',
                'angkatan.required' => 'Tahun angkatan wajib diisi.',
                'angkatan.numeric' => 'Angkatan harus berupa angka.',
                'program_studi.required' => 'Program studi wajib diisi.',
            ]
        );
    }
}