local function initud()
	os.execute("diff ../nvim/init.* ~/.config/nvim/init.* -s | grep -q diff || exit 1 && echo $(pwd) > /tmp/paath/")
	--cp ../nvim/init.* ~/.config/nvim/
end
