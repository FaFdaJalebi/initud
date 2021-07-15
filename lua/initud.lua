local function initud()
	os.execute("cp -v -u ~/.local/share/nvim/site/pack/paqs/start/initud/nvim/init.* ~/.config/nvim/")
end

return {
	initud = initud
}
