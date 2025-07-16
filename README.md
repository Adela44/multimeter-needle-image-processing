This README is in Romanian.
For the English version, see README_en.md

# Procesarea imaginii acului unui multimetru 

Programul estimează valoarea în mA indicată de acul unui multimetru cu OpenCV și MATLAB.
În folderul "poze_dem" se află câteva imagini corespunzătoare unor valori ale acului.
O funcție de interpolare este contruita pe baza acelor valori și a unghiului indicat de ac.
Determinarea unghiului în grade este realizată în Python (versiunea Python 3.10.12), iar funcția de interpolare este construită în MATLAB.

Pe scurt, programul extrage unghiul dintr-o imagine, îl introduce în funcție, iar rezultatul este valoarea în mA identificată de program.
Pentru o precizie mai mare este nevoie de mai multe imagini.

Câteva mențiuni:
"vezi_imag.py" este programul final în Python.
