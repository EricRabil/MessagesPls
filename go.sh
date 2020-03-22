make package
make install
ssh -t mainphone "killall -9 MobileSMS"
ssh -t mainphone "open com.apple.MobileSMS"
