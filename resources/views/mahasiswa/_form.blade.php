<div class="mb-3">
    <x-form-input label="NIM" name="nim" :value="$mahasiswa->nim"
                  maxlength="20" required autofocus />
</div>

<div class="mb-3">
    <x-form-input label="Nama Lengkap" name="nama" :value="$mahasiswa->nama"
                  maxlength="120" required />
</div>

<div class="mb-3">
    <label for="jenis_kelamin" class="form-label">Jenis Kelamin</label>
    <select id="jenis_kelamin" name="jenis_kelamin"
            @class(['form-select', 'is-invalid' => $errors->has('jenis_kelamin')]) required>
        <option value="">-- Pilih Jenis Kelamin --</option>
        <option value="L" {{ old('jenis_kelamin', $mahasiswa->jenis_kelamin) === 'L' ? 'selected' : '' }}>Laki-laki</option>
        <option value="P" {{ old('jenis_kelamin', $mahasiswa->jenis_kelamin) === 'P' ? 'selected' : '' }}>Perempuan</option>
    </select>
    @error('jenis_kelamin')
        <div class="invalid-feedback">{{ $message }}</div>
    @enderror
</div>

<div class="mb-3">
    <x-form-input label="Email" name="email" type="email" :value="$mahasiswa->email"
                  maxlength="120" required />
</div>

<div class="mb-3">
    <x-form-input label="Angkatan" name="angkatan" type="number" :value="$mahasiswa->angkatan"
                  required />
</div>

<div class="mb-3">
    <x-form-input label="Program Studi" name="program_studi" :value="$mahasiswa->program_studi"
                  maxlength="100" required />
</div>