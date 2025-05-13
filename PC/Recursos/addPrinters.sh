#!/bin/bash


lpadmin -p Impresora1_Recursos -E -v ipp://Impresora1_Recursos:631/printers/DummyPrinter 
lpadmin -p Impresora2_Recursos -E -v ipp://Impresora2_Recursos:631/printers/DummyPrinter 
