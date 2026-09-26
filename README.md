# VHDL Random / Pseudo-Random Generators

Two simple synthesizable random number generators for FPGA/ASIC designs:

| File | Type | Description |
|------|------|-------------|
| `Random_Generator.vhd` | True-ish noise-based | Produces a random vector by XOR-folding a 2-D array of toggling noise cells. |
| `PseduRandom_Generator.vhd` | LFSR-based | 32-bit linear-feedback shift register producing a 16-bit pseudo-random word each cycle. |

Both modules are fully synchronous and require only a clock.
