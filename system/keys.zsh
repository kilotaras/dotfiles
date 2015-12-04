# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | xclip -selection c | echo '=> Public key copied to clipboard.'"
