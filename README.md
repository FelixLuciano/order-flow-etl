[Raul Ikeda Gomes da Silva](http://lattes.cnpq.br/5935139039430914). Functional Programming. [Insper](https://github.com/Insper), 2025.

# Order Flow ETL

A high-performance ETL (Extract, Transform, Load) pipeline built in **OCaml** for processing order flow data.

Read more about this project at the [#1 Issue](https://github.com/FelixLuciano/order-flow-etl/issues/1).

## Getting Started

Sistem requirements:
- [OCaml](https://ocaml.org)
- [Opam](https://opam.ocaml.org)
- [Dune](https://dune.build)

Or just run from the devcontainer. [Read more about](https://code.visualstudio.com/docs/devcontainers/containers).

Build and run:
```sh
dune build
dune exec _build/default/bin/main.exe
```

## Usage
```sh
dune exec _build/default/bin/main.exe raw_data.csv output_data.csv
```

## License

This project is MIT licensed. [See more](LICENSE).
