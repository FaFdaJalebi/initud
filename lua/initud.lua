local function initud()
	os.execute("cp -v -u ~/.local/share/nvim/site/pack/paqs/start/initud/nvim/init.* ~/.config/nvim/")
	os.execute("pip3 install --user jedi --upgrade")
end

return {
	initud = initud
}
