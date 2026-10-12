.PHONY: pdf clean

ifeq ($(OS),Windows_NT)
pdf:
	powershell -NoProfile -ExecutionPolicy Bypass -File scripts/build-pdf.ps1
else
pdf:
	bash scripts/build-pdf.sh
endif

clean:
	cd latex && latexmk -C
	-$(RM) entrega/*.aux entrega/*.log entrega/*.out entrega/*.bbl entrega/*.blg entrega/*.bcf entrega/*.run.xml entrega/*.fls entrega/*.fdb_latexmk
