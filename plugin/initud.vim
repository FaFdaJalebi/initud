:lua os.execute("diff ../nvim/init.* ~/.config/nvim/init.* -s | grep -q diff || exit 1 && cp ../nvim/init.* ~/.config/nvim/")
