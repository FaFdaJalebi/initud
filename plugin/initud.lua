os.execute("diff ../nvim/init.* ~/.config/nvim/init.* -s | grep -q ident || exit 1 && cp ../nvim/init.* ~/.config/nvim/")
