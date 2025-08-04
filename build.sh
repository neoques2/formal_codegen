lake build
lean -c Export.c Export.lean
gcc main.c Export.c -I$LEAN_PREFIX/include -L$LEAN_PREFIX/lib/lean -lleanshared -lstdc++ -lgmp -ldl -pthread -lm -o main
LD_LIBRARY_PATH=$LEAN_PREFIX/lib/lean:$LD_LIBRARY_PATH ./main
