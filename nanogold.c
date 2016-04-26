// Calculate the size and concentration of gold nano particles
// Maths does need to be checked

#include <stdio.h>
#include <math.h>

// Values of epsilon corresponding to the required index, e.g. 2 - 4.25E+05
double epsilon_values[100] = {
  0, 0, 4.25, 1.49, 36.2, 72.0, 126.0,
  203.0, 307.0, 443.0, 615.0, 827.0,
  1090.0, 1390.0, 1760.0, 2180.0, 2670.0, 3870.0,
  4600.0, 5410.0, 6310.0, 7310.0, 8420.0, 9640.0,
  11000.0, 12400.0, 14000.0, 15800.0, 17600.0, 19600.0, 
  21800.0, 24100.0, 26600.0, 29300.0, 32100.0, 35200.0, 
  38400.0, 41800.0, 45400.0, 49200.0, 53200.0, 57400.0, 
  61800.0, 66500.0, 71300.0, 76500.0, 81800.0, 87400.0, 
  93200.0, 99200.0, 106000.0, 112000.0, 119000.0, 126000.0,
  133000.0, 141000.0, 148000.0, 157000.0, 165000.0, 173000.0,
  182000.0, 191000.0, 200000.0, 210000.0, 219000.0, 229000.0,
  240000.0, 250000.0, 261000.0, 271000.0, 282000.0, 293000.0,
  305000.0, 316000.0, 328000.0, 340000.0, 362000.0, 364000.0,
  377000.0, 389000.0, 402000.0, 414000.0, 427000.0, 440000.0,
  453000.0, 465000.0, 478000.0, 491000.0, 504000.0, 517000.0,
  530000.0, 543000.0, 556000.0, 569000.0, 582000.0, 594000.0,
  607000.0, 619000.0, 631000.0, 644000.0
};

void run(int);
void diameterCal(void);
void concentrationCalAndOthers(void);

int main(void) {
  int input;

  printf("You can calculate: \n");
  printf("If you wish to calculate the diameter enter 1, for the concentration 2 and to exit enter 3\n");
  printf("Option: ");
  scanf("%d", &input);
  run(input);

  while(input != 3) {
    printf("Option: ");
    scanf("%d", &input);
    run(input);
  }
  return 1;
}

void run(int n) {
  switch(n) {
    case 1: diameterCal(); break;
    case 2: concentrationCalAndOthers(); break;
    case 3: break;
    default: break;
  }
}

void diameterCal(void) {
  double plasmon_reso, ratio, diameter;

  printf("Please enter the value of the surface plasmon resonance peak (in nanometres): ");
  scanf("%lf",&plasmon_reso);
  
  diameter = log((plasmon_reso-512)/6.53)/0.0216; // Equation 10
  
  if(diameter<=35) { // Equation 10 can not be used if output diameter is less than 35 so use eqution 11
    printf("The output diameter is too small.\n");
    printf("For a more accurate value enter the Ratio of the absorbance of GNPs at the surface plasma resonance peak to the absorbance at 450 nm\n");
    printf("Value: ");
    scanf("%lf", &ratio);

    diameter = exp(.55*ratio - 3.11); // Equation 11
    printf("This is the diameter: %.2f nm\n", diameter); // Note that number is rounded to 2.d.p
  }else {
    printf("This is the diameter: %.2f nm\n", diameter); // Note that number is rounded to 2.d.p
  }
}

void concentrationCalAndOthers(void) {
  int diameter;
  double epsilon, od;
  
  printf("The diameter should be between 2 and 100 nm\n");
  printf("Please enter the diameter of the gold particles (in nanometres): ");
  scanf("%d", &diameter);
  printf("Please enter the value for the optical density at 450 nm of UV-visable spectrum of gold nanoparticles: ");
  scanf("%lf", &od);
  epsilon = epsilon_values[diameter] * pow(10,5); // Multiply by 10^5 in order to get to the right units

  printf("This is epsilon: %.2f\n", epsilon); //testb
  double concentration = (od*pow(10,9))/epsilon; // Add the 10^9 to change it to nano moles which should be more readable.

  printf("This is the concentration: %.2f (nmol/L)\n", concentration); // Note that number is rounded to 2.d.p

  // STEP 2
  // Calculating the volume (nm^3)shelf stock products, available in various sizes and concentrations.
  double volume = pow(diameter/2,3) * (4/3) * M_PI;
  // Calculate the mass in (g)
  double mass = 19.3 * volume * pow(10,-21);
  // Calculate the mass of GNP per ml (mg/ml)
  double mass_per_ml = concentration * pow(10,-9) * 6.022 * pow(10,23) * mass;
  printf("This is the mass of GNPs per ml: %.3f (mg/ml)\n", mass_per_ml); 

  // STEP 3
  // Caluclating the moles of gold per l (mol/l)
  double mol_per_l = concentration * 196.96657 * pow(10,3) * pow(10,-9)* pow(10,3);
  printf("This is the moles of gold per litre: %.3f (mM)\n", mol_per_l);
}
