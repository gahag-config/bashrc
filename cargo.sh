function cargo-clean-recursive {
	for dir in $(find . -type d -name target); do
		echo $dir;
		cd $dir/..;
		cargo clean;
		cd -;
	done
}
