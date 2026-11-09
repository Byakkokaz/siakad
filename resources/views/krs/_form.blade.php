<div class="row mb-3">
    <div class="col-md-6 mb-3 mb-md-0">
        <label for="mahasiswa_id" class="form-label">Mahasiswa <span class="text-danger">*</span></label>
        <select id="mahasiswa_id" name="mahasiswa_id"
                @class(['form-select', 'is-invalid' => $errors->has('mahasiswa_id')]) required autofocus>
            <option value="">-- Pilih Mahasiswa --</option>
            @foreach ($mahasiswa as $mhs)
                <option value="{{ $mhs->id }}"
                    {{ (string) old('mahasiswa_id', $krs->mahasiswa_id) === (string) $mhs->id ? 'selected' : '' }}>
                    {{ $mhs->nim }} - {{ $mhs->nama }} ({{ $mhs->program_studi }})
                </option>
            @endforeach
        </select>
        @error('mahasiswa_id')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>

    <div class="col-md-3 mb-3 mb-md-0">
        <x-form-input label="Tahun Akademik" name="tahun_akademik"
                      :value="$krs->tahun_akademik ?? '2026/2027'"
                      placeholder="2026/2027" maxlength="9" required />
    </div>

    <div class="col-md-3">
        <label for="semester" class="form-label">Semester <span class="text-danger">*</span></label>
        <select id="semester" name="semester"
                @class(['form-select', 'is-invalid' => $errors->has('semester')]) required>
            <option value="">-- Pilih Semester --</option>
            <option value="Ganjil" {{ old('semester', $krs->semester) === 'Ganjil' ? 'selected' : '' }}>Ganjil</option>
            <option value="Genap" {{ old('semester', $krs->semester) === 'Genap' ? 'selected' : '' }}>Genap</option>
        </select>
        @error('semester')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="mb-4">
    <label for="status" class="form-label">Status KRS <span class="text-danger">*</span></label>
    <select id="status" name="status"
            @class(['form-select', 'is-invalid' => $errors->has('status')]) required>
        <option value="draf" {{ old('status', $krs->status) === 'draf' ? 'selected' : '' }}>Draf</option>
        <option value="diajukan" {{ old('status', $krs->status) === 'diajukan' ? 'selected' : '' }}>Diajukan</option>
        <option value="disetujui" {{ old('status', $krs->status) === 'disetujui' ? 'selected' : '' }}>Disetujui</option>
        <option value="ditolak" {{ old('status', $krs->status) === 'ditolak' ? 'selected' : '' }}>Ditolak</option>
    </select>
    @error('status')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="card border mb-4">
    <div class="card-header bg-light d-flex justify-content-between align-items-center">
        <span class="fw-semibold">Pilih Mata Kuliah</span>
        <span class="text-body-secondary small">Pilih mata kuliah yang diambil mahasiswa</span>
    </div>
    <div class="card-body">
        @error('mata_kuliah_ids')
            <div class="alert alert-danger py-2 small mb-3">{{ $message }}</div>
        @enderror

        @php
            $selectedMk = old('mata_kuliah_ids', $krs->mataKuliah ? $krs->mataKuliah->pluck('id')->toArray() : []);
        @endphp

        <div class="row row-cols-1 row-cols-md-2 g-2">
            @forelse ($mataKuliah as $mk)
                <div class="col">
                    <div class="form-check p-2 border rounded h-100 bg-body">
                        <input class="form-check-input ms-1 me-2" type="checkbox"
                               name="mata_kuliah_ids[]" value="{{ $mk->id }}"
                               id="mk_{{ $mk->id }}"
                               {{ in_array($mk->id, $selectedMk) ? 'checked' : '' }}>
                        <label class="form-check-label w-100 cursor-pointer" for="mk_{{ $mk->id }}">
                            <span class="badge bg-secondary me-1">{{ $mk->kode_mk }}</span>
                            <strong>{{ $mk->nama_mk }}</strong>
                            <span class="badge text-bg-primary float-end me-1">{{ $mk->sks }} SKS</span>
                        </label>
                    </div>
                </div>
            @empty
                <div class="col-12 text-center text-body-secondary py-3">
                    Belum ada data mata kuliah. Silakan tambahkan data mata kuliah terlebih dahulu.
                </div>
            @endforelse
        </div>
    </div>
</div>

