<?php

namespace App\Http\Controllers;

use App\Models\Krs;
use App\Models\Mahasiswa;
use App\Models\MataKuliah;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\View\View;
use Yajra\DataTables\Facades\DataTables;

class KrsController extends Controller
{
    public function index(): View
    {
        return view('krs.index');
    }

    public function data(): JsonResponse
    {
        $query = Krs::query()
            ->select('krs.*')
            ->with('mahasiswa')
            ->withSum('mataKuliah as total_sks', 'sks');

        return DataTables::eloquent($query)
            ->addIndexColumn()
            ->addColumn('nim', function (Krs $krs) {
                return $krs->mahasiswa->nim ?? '-';
            })
            ->addColumn('mahasiswa_nama', function (Krs $krs) {
                return $krs->mahasiswa->nama ?? '-';
            })
            ->addColumn('total_sks', function (Krs $krs) {
                return ($krs->total_sks ?? 0) . ' SKS';
            })
            ->editColumn('status', function (Krs $krs) {
                $warna = match ($krs->status) {
                    'disetujui' => 'success',
                    'diajukan'  => 'warning',
                    'ditolak'   => 'danger',
                    default     => 'secondary',
                };

                return '<span class="badge text-bg-' . $warna . '">' . ucfirst($krs->status) . '</span>';
            })
            ->addColumn('aksi', function (Krs $krs) {
                return view('krs._aksi', compact('krs'))->render();
            })
            ->rawColumns(['status', 'aksi'])
            ->toJson();
    }

    public function create(): View
    {
        $mahasiswa = Mahasiswa::orderBy('nama')->get();
        $mataKuliah = MataKuliah::orderBy('nama_mk')->get();
        $krs = new Krs([
            'tahun_akademik' => '2026/2027',
            'semester'       => 'Ganjil',
            'status'         => 'draf',
        ]);

        return view('krs.create', compact('krs', 'mahasiswa', 'mataKuliah'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);

        DB::transaction(function () use ($validated, $request) {
            $krs = Krs::create([
                'mahasiswa_id'   => $validated['mahasiswa_id'],
                'tahun_akademik' => $validated['tahun_akademik'],
                'semester'       => $validated['semester'],
                'status'         => $validated['status'],
            ]);

            $mataKuliahIds = $request->input('mata_kuliah_ids', []);
            $krs->mataKuliah()->sync($mataKuliahIds);
        });

        return redirect()
            ->route('krs.index')
            ->with('success', 'Data KRS berhasil ditambahkan.');
    }

    public function show(Krs $krs): View
    {
        $krs->load(['mahasiswa', 'mataKuliah']);

        return view('krs.show', compact('krs'));
    }

    public function edit(Krs $krs): View
    {
        $krs->load(['mahasiswa', 'mataKuliah']);
        $mahasiswa = Mahasiswa::orderBy('nama')->get();
        $mataKuliah = MataKuliah::orderBy('nama_mk')->get();

        return view('krs.edit', compact('krs', 'mahasiswa', 'mataKuliah'));
    }

    public function update(Request $request, Krs $krs): RedirectResponse
    {
        $validated = $this->validated($request, $krs);

        DB::transaction(function () use ($krs, $validated, $request) {
            $krs->update([
                'mahasiswa_id'   => $validated['mahasiswa_id'],
                'tahun_akademik' => $validated['tahun_akademik'],
                'semester'       => $validated['semester'],
                'status'         => $validated['status'],
            ]);

            $mataKuliahIds = $request->input('mata_kuliah_ids', []);
            $krs->mataKuliah()->sync($mataKuliahIds);
        });

        return redirect()
            ->route('krs.index')
            ->with('success', 'Data KRS berhasil diperbarui.');
    }

    public function destroy(Krs $krs): JsonResponse
    {
        $krs->delete();

        return response()->json([
            'message' => 'Data KRS berhasil dihapus.',
        ]);
    }

    private function validated(Request $request, ?Krs $krs = null): array
    {
        return $request->validate([
            'mahasiswa_id' => [
                'required',
                'exists:mahasiswa,id',
                Rule::unique(Krs::class)->where(function ($query) use ($request) {
                    return $query->where('mahasiswa_id', $request->input('mahasiswa_id'))
                        ->where('tahun_akademik', $request->input('tahun_akademik'))
                        ->where('semester', $request->input('semester'));
                })->ignore($krs?->id),
            ],
            'tahun_akademik' => ['required', 'string', 'max:9'],
            'semester'       => ['required', 'in:Ganjil,Genap'],
            'status'         => ['required', 'in:draf,diajukan,disetujui,ditolak'],
            'mata_kuliah_ids'   => ['nullable', 'array'],
            'mata_kuliah_ids.*' => ['exists:mata_kuliah,id'],
        ], [
            'mahasiswa_id.required' => 'Mahasiswa wajib dipilih.',
            'mahasiswa_id.exists'   => 'Mahasiswa yang dipilih tidak valid.',
            'mahasiswa_id.unique'   => 'Mahasiswa ini sudah memiliki KRS pada tahun akademik dan semester yang sama.',
            'tahun_akademik.required' => 'Tahun akademik wajib diisi.',
            'tahun_akademik.max'      => 'Tahun akademik maksimal 9 karakter (contoh: 2026/2027).',
            'semester.required'       => 'Semester wajib dipilih.',
            'semester.in'             => 'Pilihan semester tidak valid.',
            'status.required'         => 'Status KRS wajib dipilih.',
            'status.in'               => 'Pilihan status tidak valid.',
            'mata_kuliah_ids.array'   => 'Format mata kuliah tidak valid.',
            'mata_kuliah_ids.*.exists' => 'Salah satu mata kuliah yang dipilih tidak terdaftar.',
        ]);
    }
}
