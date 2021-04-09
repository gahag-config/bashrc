function pdfdiff() {
	bashrc-require poppler || return 1

	diff <(pdftotext -layout "$1" /dev/stdout) <(pdftotext -layout "$2" /dev/stdout)
}
