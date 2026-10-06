# Laboratorul 2 — Tariful bicicletei

Scrie un program C23 în `src/main.c` care citește două numere întregi din intrarea standard:

```text
<minute> <student>
```

- `minute` este durata în minute și trebuie să fie nenegativă.
- `student` este `0` sau `1`. Orice altă valoare este invalidă.

## Tarif

- Primele 30 de minute sunt gratuite.
- Următoarele 60 de minute costă 1 leu/minut.
- Fiecare minut după acestea costă 2 lei/minut.
- Pentru `student == 1`, o sumă nenulă primește reducere de 20%.

Afișează exact:

```text
cost=<valoare cu două zecimale>
```

Pentru intrare lipsă sau invalidă, scrie un diagnostic pe `stderr` și ieși cu cod nenul. Nu afișa costul pentru o intrare invalidă.

Exemple:

```text
intrare: 30 0
ieșire: cost=0.00

intrare: 91 0
ieșire: cost=62.00

intrare: 31 1
ieșire: cost=0.80
```

## Contract

Aceasta este o temă de **proiectare de program**. Păstrează `src/main.c`, dar alege singur funcțiile, parametrii și tipurile interne. Testele evaluează comportamentul executabilului, nu numele funcțiilor tale.

## Verificare locală

```sh
make
make test
make sanitize
```

Înainte de predare, salvează progresul cu Git și rulează:

```sh
gh student submit
```
