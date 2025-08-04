#include <lean/lean.h>
#include <stdio.h>

uint32_t lean_add(uint32_t, uint32_t);
lean_object* initialize_Export(uint8_t, lean_object*);
void lean_initialize_runtime_module();

int main(int argc, char **argv) {
    lean_initialize_runtime_module();
    lean_object* res = initialize_Export(1, lean_io_mk_world());
    if (lean_io_result_is_error(res)) {
        lean_io_result_show_error(res);
        lean_dec_ref(res);
        return 1;
    }
    lean_dec_ref(res);
    uint32_t result = lean_add(2, 3);
    printf("%u\n", result);
    return 0;
}
