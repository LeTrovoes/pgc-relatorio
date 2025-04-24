.PHONY: all clean clean-temp pdf

# Default target
all: pdf

# Build PDF using Docker
pdf:
	@echo "Building PDF using Docker..."
	docker run --rm \
		-v $(PWD):/workspace \
		-w /workspace \
		ghcr.io/xu-cheng/texlive-full:latest \
		latexmk -pdf -interaction=nonstopmode main.tex

# Clean temporary files but keep PDF
clean-temp:
	@echo "Cleaning temporary files (keeping PDF)..."
	rm -f *.aux *.bbl *.blg *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc
	docker run --rm \
		-v $(PWD):/workspace \
		-w /workspace \
		ghcr.io/xu-cheng/texlive-full:latest \
		latexmk -c

# Clean all files including PDF
clean:
	@echo "Cleaning all files including PDF..."
	rm -f *.aux *.bbl *.blg *.fdb_latexmk *.fls *.log *.out *.pdf *.synctex.gz *.toc
	docker run --rm \
		-v $(PWD):/workspace \
		-w /workspace \
		ghcr.io/xu-cheng/texlive-full:latest \
		latexmk -c
