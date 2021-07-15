function initud()
	os.execute("echo $(pwd) > /tmp/paath")
	--os.execute("diff ../nvim/init.* ~/.config/nvim/init.* -s | grep -q diff || exit 1 && cp ../nvim/init.* ~/.config/nvim/
end
