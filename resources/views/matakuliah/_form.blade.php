<div class="mb-3">
    <x-form-input label="Kode Mata Kuliah" name="kode_mk" :value="$mataKuliah->kode_mk"
                  maxlength="20" required autofocus />
</div>

<div class="mb-3">
    <x-form-input label="Nama Mata Kuliah" name="nama_mk" :value="$mataKuliah->nama_mk"
                  maxlength="100" required />
</div>

<div class="mb-3">
    <x-form-input label="SKS" name="sks" type="number" :value="$mataKuliah->sks"
                  required min="1" max="6" />
</div>