<?php

namespace App\Http\Controllers;

use App\Models\MataKuliah;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class MataKuliahController extends Controller
{
    public function index(): View
    {
        return view('matakuliah.index');
    }

    public function data(): JsonResponse
    {
        $query = MataKuliah::query()->select(['id', 'kode_mk', 'nama_mk', 'sks']);

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('aksi', function (MataKuliah $mataKuliah) {
                return view('matakuliah._aksi', compact('mataKuliah'))->render();
            })
            ->rawColumns(['aksi'])
            ->toJson();
    }

    public function create(): View
    {
        return view('matakuliah.create', ['mataKuliah' => new MataKuliah()]);
    }

    public function store(Request $request): RedirectResponse
    {
        $mataKuliah = MataKuliah::create($this->validated($request));

        return redirect()
            ->route('matakuliah.index')
            ->with('success', 'Data mata kuliah ' . $mataKuliah->nama_mk . ' berhasil ditambahkan.');
    }

    public function show(MataKuliah $mataKuliah): View
    {
        return view('matakuliah.show', compact('mataKuliah'));
    }

    public function edit(MataKuliah $mataKuliah): View
    {
        return view('matakuliah.edit', compact('mataKuliah'));
    }

    public function update(Request $request, MataKuliah $mataKuliah): RedirectResponse
    {
        $mataKuliah->update($this->validated($request, $mataKuliah));

        return redirect()
            ->route('matakuliah.index')
            ->with('success', 'Data mata kuliah ' . $mataKuliah->nama_mk . ' berhasil diperbarui.');
    }

    public function destroy(MataKuliah $mataKuliah): JsonResponse
    {
        try {
            $mataKuliah->delete();
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Data tidak dapat dihapus: masih dipakai di data KRS.',
            ], 409);
        }

        return response()->json([
            'message' => 'Data mata kuliah ' . $mataKuliah->nama_mk . ' berhasil dihapus.',
        ]);
    }

    private function validated(Request $request, ?MataKuliah $mataKuliah = null): array
    {
        return $request->validate(
            [
                'kode_mk' => ['required', 'string', 'max:20',
                    Rule::unique(MataKuliah::class, 'kode_mk')->ignore($mataKuliah?->id)],
                'nama_mk' => ['required', 'string', 'max:100'],
                'sks' => ['required', 'numeric', 'min:1', 'max:6'],
            ], [
                'kode_mk.required' => 'Kode MK wajib diisi.',
                'kode_mk.max' => 'Kode MK maksimal 20 karakter.',
                'kode_mk.unique' => 'Kode MK sudah terdaftar.',
                'nama_mk.required' => 'Nama MK wajib diisi.',
                'nama_mk.max' => 'Nama MK maksimal 100 karakter.',
                'sks.required' => 'SKS wajib diisi.',
                'sks.numeric' => 'SKS harus berupa angka.',
                'sks.min' => 'SKS minimal 1.',
                'sks.max' => 'SKS maksimal 6.',
            ]
        );
    }
}