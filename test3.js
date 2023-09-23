function isPrima(angka) {
  if (angka <= 1) {
    return false; // Angka kurang dari atau sama dengan 1 bukan bilangan prima
  }
  for (let i = 2; i <= Math.sqrt(angka); i++) {
    if (angka % i === 0) {
      return false; // Ada pembagi lain selain 1 dan angka itu sendiri
    }
  }
  return true; // Tidak ada pembagi selain 1 dan angka itu sendiri
}

function tampilkanBilanganPrima(arr) {
  const bilanganPrima = [];

  for (let i = 0; i < arr.length; i++) {
    if (isPrima(arr[i])) {
      bilanganPrima.push(arr[i]);
    }
  }

  return bilanganPrima;
}

// Contoh penggunaan:
const arrayAwal = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const bilanganPrima = tampilkanBilanganPrima(arrayAwal);
console.log(bilanganPrima);
