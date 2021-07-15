local function initud()
	os.execute("cp -v -u ./nvim/init.* ~/.config/nvim/")
end

return {
	initud = initud
}
