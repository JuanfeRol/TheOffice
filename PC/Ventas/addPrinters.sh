#!/bin/bash

lpadmin -p Impresora1_Ventas -E -v ipp://Impresora1_Ventas:631/printers/DummyPrinter 
lpadmin -p Impresora2_Ventas -E -v ipp://Impresora2_Ventas:631/printers/DummyPrinter 
