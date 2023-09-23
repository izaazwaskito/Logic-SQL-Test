function transposeMatriks(matriks) {
  const baris = matriks.length;
  const kolom = matriks[0].length;

  const matriksHasil = new Array(kolom)
    .fill(null)
    .map(() => new Array(baris).fill(null));

  for (let i = 0; i < baris; i++) {
    for (let j = 0; j < kolom; j++) {
      matriksHasil[j][i] = matriks[i][j];
    }
  }

  return matriksHasil;
}

const matriks2x3 = [
  [1, 2, 3],
  [4, 5, 6],
];

const matriks3x2 = transposeMatriks(matriks2x3);
console.log(matriks3x2);
