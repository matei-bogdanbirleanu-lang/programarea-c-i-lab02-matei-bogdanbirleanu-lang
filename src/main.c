#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int main(void){
    int minute;
    int student; // poate fi doar 0 sau 1

    // Citim de la intrarea standard
    if (scanf("%d %d", &minute, &student) != 2) {
        return EXIT_FAILURE;
    }

    // Validam ca student este 0 sau 1
    assert(!(student != 0 && student != 1));

    // 2. Diagnosticele pentru intrari invalide trebuie scrise la stderr
    if (minute < 0){
        fprintf(stderr, "minute negative\n");
        return EXIT_FAILURE;
    }

    // Calculam costul
    float cost = 0.0f;

    // Folosim (float) si sufixul f pentru a scapa de avertismentele de conversie
    if (minute <= 30){
        cost = 0.0f;
    } else if(minute <= 90){
        cost = (float)(minute - 30);
    } else {
        cost = (float)((minute - 90) * 2 + 60);
    }

    // Verific daca este student
    if (student){
        cost = cost * 0.8f;
    }

    // Afisez costul cu 2 zecimale (singurul lucru care ajunge in stdout)
    printf("cost=%.2f\n", cost);

    return EXIT_SUCCESS;
}
