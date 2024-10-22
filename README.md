# nixcon-2024-services-flake

Presentation material for [my talk at NixCon 2024](https://talks.nixcon.org/nixcon-2024/talk/review/UTZQ8YZHKSMTUPRSC83TKALDUYNL9BCX).

This presentation demonstrates how [services-flake](https://github.com/juspay/services-flake) can simplify Dev/CI workflows using <https://github.com/juspay/todo-app> as an example.

## View presentation

```sh
nix run github:shivaraj-bh/nixcon-2024-services-flake
```

## Edit presentation

```sh
nix develop
presenterm presentation.md
```
>[!NOTE]
> `presenterm` has hot-reload builtin

Open your favourite editor and modify [slides](presentation.md).

## Generate PDF
>[!NOTE]
> You have to clone the repo for this as `presenterm` doesn't yet support specifying a custom location to output the PDF.

```sh
nix run .#exportPdf
```

